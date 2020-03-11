package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCParkDAO implements ParkDAO {

	private JdbcTemplate jdbcTemplate;

	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		ArrayList<Park> allNationalParks = new ArrayList<>();
		String nationalParks = "SELECT * FROM park ORDERBY parkname ASC";
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
		// TODO Auto-generated method stub
		return null;
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
		allParks.setDescription(results.getString("description"));
		allParks.setEntryFee(results.getBigDecimal("entryfee"));
		allParks.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));

		return allParks;

	}

}
