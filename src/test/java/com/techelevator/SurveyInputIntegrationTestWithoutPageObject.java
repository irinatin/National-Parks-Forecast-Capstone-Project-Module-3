package com.techelevator;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.java.Before;

public class SurveyInputIntegrationTestWithoutPageObject {
	
	private static WebDriver webDriver;
	
	
	@BeforeClass
	public static void openWebBrowserForTesting() {
		
		String homeDir = System.getProperty("user.home");
		
		System.setProperty("webdriver.chrome.driver", homeDir+"/dev-tools/chromedriver/chromedriver");
		webDriver = new ChromeDriver();
	}
	
	@Before public void openHomePage() {
		webDriver.get("http://localhost:8080/45-m3-java-capstone/");
	}
	
	@AfterClass
	public static void closeWebBrowser() {
		webDriver.close();
	}
	
	@Test 
	public void pages_can_be_navigated_by_clicking_on_links() {
		WebElement surveyLink = webDriver.findElement(By.linkText("Survey")); //xPath
		JavascriptExecutor ex = (JavascriptExecutor)webDriver;
		ex.executeScript("arguments[0].click();", surveyLink);
		
		assertTrue(webDriver.getTitle().endsWith("Survey"));
		WebElement nav = webDriver.findElement(By.tagName("nav"));
		assertEquals("Survey", nav.getText());
	}

}
