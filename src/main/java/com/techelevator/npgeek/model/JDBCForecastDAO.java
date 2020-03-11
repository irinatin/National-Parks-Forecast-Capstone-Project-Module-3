package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCForecastDAO implements ForecastDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	public JDBCForecastDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Forecast> getForecastByParkCode(String parkCode) {
		List<Forecast> foundForecasts = new ArrayList<>();
		
		String sqlGetChosenPark = "SELECT * FROM weather WHERE parkcode LIKE ? ORDER BY fivedayforecastvalue";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetChosenPark, parkCode);
		while(results.next()) {
			Forecast forecastResult = mapToRowForecast(results);
			foundForecasts.add(forecastResult);

		}
		return foundForecasts;
	}

	

	@Override
	public String getForecastBasedRec(String parkCode, int day) {
		String sqlGetForecast = "SELECT forecast FROM weather WHERE parkcode = ? AND fivedayforecastvalue = ? ORDER BY fivedayforecastvalue";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetForecast, parkCode, day);
		
		if(results.getString("forecast").equals("snow")) {
			return "Please pack the snowshoes.";
		} else if(results.getString("forecast").equals("rain")) {
			return "Please pack the rain gear and wear waterproof shoes.";
		} else if(results.getString("forecast").equals("thunderstorms")) {
			return "Please seek shelter and avoid hiking on exposed ridges.";
		} else if(results.getString("forecast").contentEquals("sun") ) {
			return "Please pack a sunblock.";
		}
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getLowTempRec(String parkCode, int day) {
		String sqlGetLowTemp = "SELECT low FROM weather WHERE parkcode = ?  AND fivedayforecastvalue = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetLowTemp, parkCode, day);
		
		if(results.getDouble("low") < 20) {
			return "Please stay warm and try to avoid being outside.";
		} else if(results.getDouble("high") - (results.getDouble("low")) > 20) {
			return "Please wear breathable layers.";
		}
		
		return null;
	}

	@Override
	public String getHighTempRec(String parkCode, int day) {
		String sqlGetHighTemp = "SELECT low FROM weather WHERE parkcode = ?  AND fivedayforecastvalue = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetHighTemp, parkCode, day);
		
		if(results.getDouble("high") > 75) {
			return "Please bring an extra gallon of water.";
		}
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getExpectedWeather(String parkCode, int day) {
		String sqlGetExpectedWeather = "SELECT forecast FROM weather WHERE parkcode = ? AND fivedayforecastvalue = ?";
		
		return sqlGetExpectedWeather;
	}
	
	private Forecast mapToRowForecast(SqlRowSet results) {
		Forecast allForecasts = new Forecast();
		allForecasts.setParkCode(results.getNString("parkcode"));
		allForecasts.setDay(results.getInt("fivedayforecastvalue"));
		allForecasts.setLowTemp(results.getDouble("low"));
		allForecasts.setHighTemp(results.getDouble("high"));
		allForecasts.setWeather(results.getNString("forecast"));
		
		return allForecasts;
	}

}

////snow
//"Please pack the snowshoes."
//
////rain
//"Please pack the rain gear and wear waterproof shoes."
//
////thunderstorms
//"Please seek shelter and avoid hiking on exposed ridges."
//
////sun
//"Please pack a sunblock."
//
////temp over 75
//"Please bring an extra gallon of water."
//
////difference more than 20 degrees
//"Please wear breathable layers."
//
////temp below 20
//"Please stay warm and try to avoid being outside."















