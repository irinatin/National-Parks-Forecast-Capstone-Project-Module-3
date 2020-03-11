package com.techelevator.npgeek.model;

import java.util.List;

public interface ParkDAO {

	public List<Park> getAllParks();
	// this method will return a list of all National Parks
	// displayed in alphabetical order on the home page.

	public Park searchParkByParkCode(String parkCode);
	// this method will return a National Park based off the
	// parkCode which will display the detail described in the
	// park data source

	public List<Park> allParksByNumberOfSurveys();
	// this method will return a list of National Parks by survey results
	// ordering them from the highest rating to the lowest rating.

}
