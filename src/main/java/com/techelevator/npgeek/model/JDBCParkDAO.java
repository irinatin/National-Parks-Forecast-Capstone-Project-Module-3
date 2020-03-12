package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCParkDAO implements ParkDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		ArrayList<Park> allNationalParks = new ArrayList<>();
		String nationalParks = "SELECT * FROM park ORDER BY parkname ASC";
		SqlRowSet parks = jdbcTemplate.queryForRowSet(nationalParks);
		while (parks.next()) {
			Park allParks = mapRowToPark(parks);
			allNationalParks.add(allParks);
		}

		return allNationalParks;
	}

	@Override
	public Park searchParkByParkCode(String parkCode) {
		Park myPark = null;
		String sqlParkInfo = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet parks = jdbcTemplate.queryForRowSet(sqlParkInfo, parkCode);
		while (parks.next()) {
			myPark = mapRowToPark(parks);
		}
		return myPark;
	}

	@Override
	public List<Park> allParksByNumberOfSurveys() {
		ArrayList<Park> parksBySurveys = new ArrayList<>();
		String surveyResults= "SELECT park.parkcode, park.parkname, COUNT(*) AS surveycount " +
							   "FROM survey_result LEFT JOIN park ON survey_result.parkcode = park.parkcode " +
							   "GROUP BY park.parkcode ORDER BY surveycount DESC;";
		SqlRowSet surveys = jdbcTemplate.queryForRowSet(surveyResults);
		while (surveys.next()) {
			Park totalSurveys = mapRowToPark(surveys);
			parksBySurveys.add(totalSurveys);
					
		}
	
		return parksBySurveys;
	}

	private Park mapRowToPark(SqlRowSet results) {
		Park allParks = new Park();
		allParks.setParkCode(results.getString("parkcode"));
		allParks.setParkName(results.getString("parkname"));
		allParks.setState(results.getString("state"));
		allParks.setAcreage(results.getDouble("acreage"));
		allParks.setElevation(results.getDouble("elevationInFeet"));
		allParks.setMilesOfTrail(results.getDouble("milesoftrail"));
		allParks.setNumberOfSites(results.getInt("numberofcampsites"));
		allParks.setClimate(results.getString("climate"));
		allParks.setYearFounded(results.getInt("yearfounded"));
		allParks.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
		allParks.setQuote(results.getString("inspirationalquote"));
		allParks.setQuoteSource(results.getString("inspirationalquotesource"));
		allParks.setParkDescription(results.getString("parkdescription"));
		allParks.setEntryFee(results.getBigDecimal("entryfee"));
		allParks.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));

		return allParks;

	}

}
