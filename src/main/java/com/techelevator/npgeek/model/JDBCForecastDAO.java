package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
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
				
		String sqlGetForecast = "SELECT CASE forecast WHEN 'snow' THEN 'Please pack the snowshoes.' "
				+ "WHEN 'rain' THEN 'Please pack the rain gear and wear waterproof shoes.' "
				+ "WHEN 'sun' THEN 'Please pack a sunblock.' "
				+ "WHEN 'thunderstorms' THEN 'Please seek shelter and avoid hiking on exposed ridges.' ELSE '' END AS suggestion "
				+ "FROM weather WHERE parkcode = ? AND fivedayforecastvalue = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetForecast, parkCode, day);
		
		String forecasted = "";
		
		while(results.next()) {
		forecasted = results.getString("suggestion");
		}
		
		return forecasted;
	}

	@Override
	public String getLowTempRec(String parkCode, int day) {
		String sqlGetLowTemp = "SELECT CASE WHEN EXISTS(SELECT low FROM weather WHERE low < 20 AND parkcode = ?  AND fivedayforecastvalue = ?) THEN 'Beware the cold, yo.' ELSE '' END AS coldwarn";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetLowTemp, parkCode, day);
		
		String forecasted = "";
		
		while(results.next()) {
		forecasted = results.getString("coldwarn");
		}
		
		return forecasted;
	}

	@Override
	public String getHighTempRec(String parkCode, int day) {
		String sqlGetLowTemp = "SELECT CASE WHEN EXISTS(SELECT high FROM weather WHERE high > 75 AND parkcode = ?  AND fivedayforecastvalue = ?) THEN 'Bring a spare gallon of water.' ELSE '' END AS hotwarn";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetLowTemp, parkCode, day);
		
		String forecasted = "";
		
		while(results.next()) {
		forecasted = results.getString("hotwarn");
		}
		
		return forecasted;
	}

	@Override
	public String getExpectedWeather(String parkCode, int day) {
		String sqlGetExpectedWeather = "SELECT forecast FROM weather WHERE parkcode = ? AND fivedayforecastvalue = ?";
		
		return sqlGetExpectedWeather;
	}
	
	private Forecast mapToRowForecast(SqlRowSet results) {
		Forecast allForecasts = new Forecast();
		allForecasts.setParkCode(results.getString("parkcode"));
		allForecasts.setDay(results.getInt("fivedayforecastvalue"));
		allForecasts.setLowTemp(results.getDouble("low"));
		allForecasts.setHighTemp(results.getDouble("high"));
		allForecasts.setWeather(results.getString("forecast"));
		
		return allForecasts;
	}

}


















