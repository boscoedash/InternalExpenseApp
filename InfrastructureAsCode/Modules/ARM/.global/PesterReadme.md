[[_TOC_]]


## Published Test cases - Module/Context wise explanation

## Context: General module folder tests

### Module folder

Test case Name | Description | Example
-|-|-
 Module name should be Pascal cased | In repository all the Module folder name should be Pascal cased <br>(Naming convention in which the first letter of each word in a compound word is capitalized.)</br> |![](./pesterImages/pascalcased.PNG)
 Module should contain a [deploy.json] file | In repository **deploy.json** file should present in all the Module folder | ![](./pesterImages/deployjsonfile.PNG)
 Module should contain a [Parameters] folder | In repository **Parameters** folder should present in all the Module folder | ![](./pesterImages/parametersfolder.PNG)
 Module should contain a [Pipeline] folder | In repository **Pipeline** folder should present in all the Module folder | ![](./pesterImages/pipelinefolder.PNG)
 Module should contain a [readme.md] file|In repository **readme.md** file should present in all the Module folder|![](./pesterImages/Readmefileinmodule.PNG)
 Module should contain a [Scripts] folder|In repository **Scripts** folder should present in all the Module folder|![](./pesterImages/scriptfolderinmodule.PNG)
 Module should contain a [Tests] folder|In repository **Tests** folder should present in all the Module folder|![](./pesterImages/Testfolderinmodule.PNG)



### Parameters folder
Test case Name | Description | Example
-|-|-
Parameters folder should contain one or more *parameters.json files | In repository one or more **XXparameters.json** should present in Parameters folder| ![](./pesterImages/parametersjsonfile.PNG)
*parameters.json files in the Parameters folder should not be empty |In repository **empty *parameters*.json** will not be eccepted |
*parameters.json files in the Parameters folder should be valid JSON | In Parameters folder parameters.json file should be a **valid JSON** |

### Pipeline folder
Test case Name | Description | Example
-|-|-
Pipeline folder should contain one or more *.yml files (pipeline files) | In repository one or more ***.yml** should present in Pipeline folder | ![](./pesterImages/yamlfile.PNG)
Pipeline folder should contain a THIS_IS_A_UNIQUE_PIPELINE.md marker, if it contains more than one *.yml files | **THIS_IS_A_UNIQUE_PIPELINE.md** should present in Pipeline folder if it contains more than one *.yml files |

### Tests folder
Test case Name | Description | Example
-|-|-
Tests folder should contain one or more *.tests.ps1 files |**.tests.ps1 files** should present in Tests folder|![](./pesterImages/fileintestfolder.PNG)
*.tests.ps1 files should not be empty | In Tests folder, **empty *tests.ps1*** will not be accepted|

## Context: Readme content tests


Test case Name | Description | Example
-|-|-
Readme.md file should not be empty|**Empty *Readme.md*** will not be accepted|
Heading1 title should be identical with the module's folder name|Heading1 should have the same as Module folder Name|![](./pesterImages/identicalmodulename.PNG)
Readme.md file should contain the these Heading2 titles in order:<br>Resource Types, Parameters, Outputs, Considerations, Additional resources</br>|Sequence of Resource Types, Parameters, Outputs, <br>Considerations, Additional resources should present in Heading2 titles</br>|![](./pesterImages/h2.PNG)
Resources section should contain all resources from the deploy.json file|All Resource available in deploy.json file should present in Resources section|![](./pesterImages/resourcesection.PNG)
Parameters section should contain <br>a table with these column names in order:</br><br>Parameter Name, Type, Description, Default Value, Possible values</br>|Table with sequence <br>Parameter Name, Type, Description, Default Value,</br><br>Possible values in Parameters section should present</br>|![](./pesterImages/paramheading.PNG)
Parameters section should contain all <br>parameters from the deploy.json file</br>|All parameters available in deploy.json file should present in Parameters section|![](./pesterImages/paramsecinreadme.PNG)
Output section should contain all outputs defined in the deploy.json file|All outputs available in deploy.json file should present in outputs section|![](./pesterImages/outputsecinreadme.PNG)
Additional resources section should contain <br>at least one bullet point with a reference</br>| At least One Bullet point should be made in Additional resources section|![](./pesterImages/additionalresou.PNG)
Outputs section should contain a table with these column names<br> in order: Output Name, Type, Description</br>|Sequence of Output Name, Type, Description should be followed in Outputs section table|![](./pesterImages/outputsecheaderinreadme.PNG)

## Context: IAC Functional tests

### Deployment template tests
Test case Name | Description | Example
-|-|-
The deploy.json file should not be empty |In Module folder, **empty *deploy*.json** will not be accepted |
The deploy.json file should be a valid JSON |In Module folder deploy.json file should be a **valid JSON**|
Template schema version should be the latest | In deploy.json file, **latest** Schema version should be used|![](./pesterImages/schemaverions.PNG)
Template schema should use HTTPS reference | In deploy.json file, **HTTPS** reference should be used by Schema |![](./pesterImages/httpsschema.PNG)
All apiVersion properties should be set to a static, hard-coded value  |In deploy.json file, all resource **APIVERSION** should not be variablized or parameterized, <br>it should be static & hard-coded</br> |![](./pesterImages/apiversion.PNG)
All apiVersions in the template should be 'recent'|In deploy.json file,<br> all resource should be using recent & update **APIVERSION**</br>|![](./pesterImages/apiversion.PNG)
The deploy.json file should contain ALL supported elements:<br>schema, contentVersion, parameters, variables, resources, functions, outputs</br>|In deploy.json file,<br> All **supported element** should present</br>|![](./pesterImages/supportedelement.PNG)
If delete lock is implemented,<br>the template should have a lockForDeletion parameter with the default value of false</br>|In deploy.json file,<br>If delete lock is implemented then **lockForDeletion parameter** should have default value as **false**</br> |![](./pesterImages/deletlockparam.PNG)
If delete lock is implemented,<br>it should have a deployment condition with the value of parameters('lockForDeletion')</br> |In deploy.json file,<br>If delete lock is implemented then lockForDeletion resource should have </br>**condition** value as **parameters('lockForDeletion')** |![](./pesterImages/deletlockcondition.PNG)
Parameter and variable names should be camel-cased (no dashes or underscores and must start with lower-case letter) |All Parameter and variable names in deploy.json file should be **camel cased**(Naming convention in which each word within a compound word is capitalized except for the first word.) and **no dashes** or **underscores** is used|![](./pesterImages/Parametercasing.PNG)
Standard outputs should be provided (e.g. resourceName, resourceId, resouceGroupName | Output section in deploy.json file should contain standard output **(e.g. resourceName, resourceId, resouceGroupName)** |
CUA ID deployment should be present in the template|All template should have CUA ID deployment |![](./pesterImages/CUID.PNG)
The Location should be defined as a parameter,<br>with the default value of 'resourceGroup().Location'</br>or deployment().Locationfor ResourceGroup or <br>Subscription deployment scope respectively</br>|'resourceGroup().Location' or deployment().Location <br>should be used in parameter for ResourceGroup</br> or Subscription deployment scope respectively |![](./pesterImages/locationprop.PNG)
All resources that have a Location <br>property should refer to the Location parameter</br>'parameters('Location')'|All resources that have a Location<br> property should refer to the Location parameter </br>'parameters('Location')'|![](./pesterImages/location.PNG)
Parameters' description should start either by <br>'Optional.' or 'Required.' or 'Generated.'</br>|'Optional.' or 'Required.' or 'Generated.' either of them <br>should be used in start in Parameters' description</br>|![](./pesterImages/paramdescription.PNG)
Output should have descriptions|Output should have descriptions|![](./pesterImages/outputdescription.PNG)|