using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using SeleniumDemo;

[TestClass]
public class Test1 : BaseUITest
{
    [TestMethod]
    public static void HomeLinksToCorrectURL()
    {
        var homepage = Driver.FindElement(By.ClassName("Container"));
    }
}