using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTestProject1
{
    [TestClass]
    public abstract class BaseClassUiTest
    {
        /// <summary>
        /// Gets the browser.
        /// </summary>
        /// <value>The browser.</value>
        public static IWebDriver Driver { get; set; }
        public static string _theHost;
        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext { get; set; }

        [ClassInitialize(InheritanceBehavior.BeforeEachDerivedClass)]
        public static void SetupBrowserWindow(TestContext context)
        {
            if (Driver == null)
            {

                var driverLocation = Environment.GetEnvironmentVariable("ChromeWebDriver", EnvironmentVariableTarget.Machine);
                ChromeOptions options = new ChromeOptions();
                options.AddArguments("start-maximized");
                options.AddArguments("--incognito");
                Driver = new ChromeDriver(driverLocation, options);
            }

            Driver.Navigate().GoToUrl(new Uri("https://expenseweb.azurewebsites.us"));
            _theHost = new Uri(Driver.Url).GetLeftPart(UriPartial.Authority);
        }

        [ClassCleanup(InheritanceBehavior.BeforeEachDerivedClass)]
        public static void BrowserCleanup()
        {
            if (Driver != null)
            {
                Driver.Close();
                Driver.Dispose();
            }
        }
    }
}
