package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.JDBCParkDAO;
import com.techelevator.npgeek.model.Park;

@Controller
public class NPController {
	
	@Autowired
	private JDBCParkDAO parkDao;
	
//	@Autowired
//	private JDBCSurveyDAO surveyDao;
//	
//	@Autowired
//	private JDBCForecastDAO forecastDao;

	@RequestMapping(path = {"/", "/home"}, method = RequestMethod.GET)
	public String displayHome(ModelMap map) {
		List<Park> parks = parkDao.getAllParks();
		map.addAttribute("parks", parks);
		return "home";
	}
	
	@RequestMapping(path = "/parkDetails", method = RequestMethod.GET)
	public String displayDetails(HttpSession session, @RequestParam String parkCode) {
		return "detail";
	}
	
	@RequestMapping(path = "/surveyPage", method = RequestMethod.GET)
	public String displaySurveyForm(HttpSession session) {
		return "survey";
	}
	
	@RequestMapping(path = "/surveyPage", method = RequestMethod.POST)
	public String processSurvey(HttpSession session) {
		return "redirect:/favorite";
	}
	
	@RequestMapping(path = "/favorite", method = RequestMethod.GET)
	public String displayFavorite(HttpSession session) {
		return "favorite";
	}
	
}
