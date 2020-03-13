package com.techelevator.npgeek.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.model.Forecast;
import com.techelevator.npgeek.model.JDBCForecastDAO;
import com.techelevator.npgeek.model.JDBCSurveyDAO;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;

@Controller
public class NPController {
	
	@Autowired
	private ParkDAO parkDao;
	
	@Autowired
	private JDBCSurveyDAO surveyDao;
	
	@Autowired
	private JDBCForecastDAO forecastDao;

	@RequestMapping(path = {"/", "/home"}, method = RequestMethod.GET)
	public String displayHome(ModelMap map) {
		List<Park> parks = parkDao.getAllParks();
		map.addAttribute("parks", parks);
		return "home";
	}
	
	@RequestMapping(path = "/parkDetails", method = RequestMethod.GET)
	public String displayDetails(HttpSession session, @RequestParam String parkCode, ModelMap models, @RequestParam(required=false) String tempScale) {
		
		Park park = parkDao.searchParkByParkCode(parkCode);
		
		models.put("park", park);
		
		List<Forecast> forecasts = forecastDao.getForecastByParkCode(parkCode);
		
		Forecast forecastOne = forecasts.get(0);
		models.put("forecastOne", forecastOne);
		
		Forecast forecastTwo = forecasts.get(1);		
		models.put("forecastTwo", forecastTwo);
		
		Forecast forecastThree = forecasts.get(2);		
		models.put("forecastThree", forecastThree);
		
		Forecast forecastFour = forecasts.get(3);		
		models.put("forecastFour", forecastFour);
		
		Forecast forecastFive = forecasts.get(4);		
		models.put("forecastFive", forecastFive);
		
		String advisory = "";
		
		advisory = advisory + forecastDao.getForecastBasedRec(parkCode, 1) + " ";
		advisory = advisory + forecastDao.getLowTempRec(parkCode, 1) + " ";
		advisory = advisory + forecastDao.getHighTempRec(parkCode, 1) + " ";

		models.put("advisory", advisory);
		
		boolean isFahrenheit = true;
		
		if( (tempScale == null) && (session.getAttribute("tempPref") == null)) {
			isFahrenheit = true;
			tempScale = "Fahrenheit";
			session.setAttribute("tempPref", "Fahrenheit");
		}
		
		else if( (tempScale == null) && (session.getAttribute("tempPref")).equals("Celsius")) {
			isFahrenheit = false;
		}
		
		else if( (tempScale == null) && (session.getAttribute("tempPref")).equals("Fahrenheit")) {
			isFahrenheit = true;
		}
		
		else if(tempScale != null) {
			session.setAttribute("tempPref", tempScale);
		}
		
		if ((session.getAttribute("tempPref")).equals("Celsius")) {
			isFahrenheit = false;
		}
		
		if ((session.getAttribute("tempPref")).equals("Fahrenheit")) {
			isFahrenheit = true;
		}
		
		models.put("tempCheck", isFahrenheit);
		
		return "parkDetails";
				
	}
	
	@RequestMapping(path = "/surveyPage", method = RequestMethod.GET)
	public String displaySurveyForm(HttpSession session, ModelMap map, Survey surv) {
		List<Park> parks = parkDao.getAllParks();
		map.addAttribute("parks", parks);
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
