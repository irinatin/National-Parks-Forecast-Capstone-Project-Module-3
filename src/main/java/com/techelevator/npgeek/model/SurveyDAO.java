package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDAO {
	
	public List<Survey> getAllSurveys();

	public Survey submitSurvey(Survey surv);
	
	public int getNextId();
	
}
