package com.techelevator;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.WebDriver;
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
	

}
