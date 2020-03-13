package com.techelevator.npgeek.cukes;

import org.openqa.selenium.WebDriver;

public class SurveyResultPage extends SurveyInputTestPage {
	
	private WebDriver webDriver;
	
	public SurveyResultPage(WebDriver webDriver) {
		this.webDriver = webDriver;
	}
	
	public String getTitle() {
		return webDriver.getTitle();
	}

}
