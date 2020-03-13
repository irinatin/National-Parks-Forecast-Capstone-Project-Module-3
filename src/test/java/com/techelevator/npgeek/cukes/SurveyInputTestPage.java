package com.techelevator.npgeek.cukes;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class SurveyInputTestPage {
	
	private WebDriver webDriver;
	
	public SurveyInputTestPage chooseFavoritePark(String parkName) {
		WebElement parkField = webDriver.findElement(By.className("parkName"));
		parkField.sendKeys(parkName);
		return this;
	}
	
	public SurveyInputTestPage enterEmailAddress(String emailAddress) {
		WebElement emailAddressField = webDriver.findElement(By.className("emailAddress"));
		emailAddressField.sendKeys(emailAddress);
		return this;
	}
	
	public SurveyInputTestPage chooseState(String state) {
		WebElement stateField = webDriver.findElement(By.className("state"));
		stateField.sendKeys(state);
		return this;
	}
	
	public SurveyInputTestPage chooseActivityLevel(String activityLevel) {
		WebElement activityLevelField = webDriver.findElement(By.className("activityLevel"));
		activityLevelField.sendKeys(activityLevel);
		return this;
	}
	
	public SurveyInputTestPage submitForm() {
		WebElement submitButton = webDriver.findElement(By.className("submitButton"));
		submitButton.click();
		return new SurveyResultPage(webDriver);
	}

}
