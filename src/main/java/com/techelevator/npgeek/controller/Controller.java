package com.techelevator.npgeek.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



public class Controller {
	
//	@Autowired
//	private JdbcParkDao parkDao;
//	
//	@Autowired
//	private JdbcSurveyDao surveyDao;
//	
//	@Autowired
//	private JdbcForecastDao forecastDao;

	@RequestMapping(path = {"/", "/home"}, method = RequestMethod.GET)
	public String displayHome() {
		return "homePage";
	}
	
	@RequestMapping(path = "/parkDetails", method = RequestMethod.GET)
	public String displayDetails() {
		return "detail";
	}
	
	@RequestMapping(path = "/surveyPage", method = RequestMethod.GET)
	public String displaySurveyForm() {
		return "survey";
	}
	
	@RequestMapping(path = "/surveyPage", method = RequestMethod.POST)
	public String processSurvey() {
		return "redirect:/favorite";
	}
	
	@RequestMapping(path = "/favorite", method = RequestMethod.GET)
	public String displayFavorite() {
		return "favorite";
	}
	
	
	
}
