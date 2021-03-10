using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using System.IO;
using System.Reflection;



namespace SeleniumDemo
{
    [TestClass]
    public class BaseUITest
    {
        public static IWebDriver Driver;

        [ClassInitialize]
        public static void SetupBrowserWindow(TestContext context)
        {
            if (Driver == null)
            {
                var driverLocation = Environment.GetEnvironmentVariable("ChromeWebDriver", EnvironmentVariableTarget.Machine);
                ChromeOptions options = new ChromeOptions();
                options.AddArguments("start-maximized");
                Driver = new ChromeDriver(driverLocation, options);
            }


            Driver.Navigate().GoToUrl(new Uri("https://expenseweb.azurewebsites.us"));

            //_theHost = new Uri(Driver.Url).GetLeftPart(UriPartial.Authority);

        }


        [ClassCleanup]
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