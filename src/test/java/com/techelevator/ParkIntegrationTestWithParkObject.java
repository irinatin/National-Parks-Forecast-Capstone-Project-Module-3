package com.techelevator;

import java.util.concurrent.TimeUnit;

import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.java.Before;

public class ParkIntegrationTestWithParkObject {
	
	private static WebDriver webDriver;
	
	@BeforeClass
	public static void openWebBrowserForTesting() {
		
		String homeDir = System.getProperty("user.home");
		
		System.setProperty("webdriver.chrome.driver", homeDir+"/dev-tools/chromedriver/chromedriver");
		webDriver = new ChromeDriver();
	}
	
	@Before 
	public void openHomePage() {
		webDriver.get("http://localhost:8080/45-m3-java-capstone/");
	}
	
	@AfterClass
	public static void closeWebBrowser() {
		webDriver.close();
	}
	
	
	
	@Test
	public void elements_can_be_found_by_id() throws InterruptedException {
		TimeUnit.SECONDS.sleep(3);
		clickOnDetails();
		WebElement parkName = webDriver.findElement(By.id("bigPic"));
		
		Assert.assertNotNull(parkName);
		
		
	}
	
	
	

	//helper method - click on each park (one park)
	private void clickOnDetails() {
		WebElement parkDetailImageLink = webDriver.findElement(By.xpath("/html/body/div[2]/div[2]/a/img")); //xPath
		JavascriptExecutor ex = (JavascriptExecutor)webDriver;
		ex.executeScript("arguments[0].click();", parkDetailImageLink);
	}
	

}
