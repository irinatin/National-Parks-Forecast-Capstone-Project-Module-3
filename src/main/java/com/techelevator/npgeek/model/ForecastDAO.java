package com.techelevator.npgeek.model;

import java.util.List;

public interface ForecastDAO {
	
	public List<Forecast> getForecastByParkCode(String parkCode);
	
	public String getForecastBasedRec(String parkCode, int day);
	
	public String getLowTempRec(String parkCode, int day);
	
	public String getHighTempRec(String parkCode, int day);
	
	public String getExpectedWeather(String parkCode, int day);
	

}


//JDBCForecastDAO.java methods
//getForecastByParkID(string parkId)
//getWeatherBasedRec(string parkId, int day)
//getHotRec(int day, string parkid) (either returns and empty string or “Bring extra water etc.)
//getColdRec(string parkId, int day)
//getLayerRec(string parkId, int day)
