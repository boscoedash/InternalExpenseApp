using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

[TestClass]
public class Test1:BaseUITest
    {
        public static void HomeLinksToCorrectURL()
        {
            var homepage = Driver.findelement(By.ClassName("Container"))
        }
    }