using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.Linq;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1 : BaseClassUiTest 
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

        
    }
}
