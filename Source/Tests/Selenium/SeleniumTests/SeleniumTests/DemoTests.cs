using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using System.Linq;

namespace UnitTestProject1
{
    [TestClass]
    public class DemoTests : BaseClassUiTest 
    {
        [TestInitialize]
        public void TestSetUp() 
        {
            Driver.Navigate().GoToUrl(new Uri($"{_theHost}/home"));
        }

        [TestMethod]
        public void Title_ShouldBeExpenses()
        {
            var pageTitle = Driver.FindElements(By.TagName("h2")).FirstOrDefault().Text;
            //Assert 
            Assert.AreEqual(pageTitle, "Expenses");
        }

        [TestMethod]
        public void Link_RegisterLinkShouldNavigateToRegisterPage()
        {
            var registerLink = Driver.FindElement(By.Id("registerLink"));

            registerLink.SendKeys(Keys.Enter);
            var wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(1));

            var registerURL = Driver.Url;

            //Assert 
            Assert.AreEqual(registerURL, "https://expenseweb.azurewebsites.us/Account/Register");
        }

        [TestMethod]
        public void Registration_ShouldFailIfEmailFormatIsInvalid()
        {
            var registerLink = Driver.FindElement(By.Id("registerLink"));

            registerLink.SendKeys(Keys.Enter);
            var wait = new WebDriverWait(Driver, TimeSpan.FromSeconds(1));

            var register = Driver.FindElement(By.ClassName("btn-default"));
            var emailFIeld = Driver.FindElement(By.Id("Email"));

            emailFIeld.SendKeys("jdoe@contoso.com");
            register.SendKeys(Keys.Enter);

            var errorMessage = Driver.FindElement(By.ClassName("validation-summary-errors"));
            //Assert 
            Assert.AreEqual(errorMessage.Text, "The Password field is required.");
        }
    }
}
