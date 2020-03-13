package com.techelevator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.npgeek.model.Forecast;
import com.techelevator.npgeek.model.ForecastDAO;
import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.SurveyDAO;

import junit.framework.Assert;

public abstract class DAOIntegrationTest {

	/*
	 * Using this particular implementation of DataSource so that every database
	 * interaction is part of the same database session and hence the same database
	 * transaction
	 */
	private static SingleConnectionDataSource dataSource;

	private ParkDAO parkDao;
	private ForecastDAO forecastDao;
	private SurveyDAO surveyDao;
	private JdbcTemplate jdbcTemplate;

	/*
	 * Before any tests are run, this method initializes the datasource for testing.
	 */
	@BeforeClass
	public static void setupDataSource() {
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/historygeek");
		dataSource.setUsername("postgres");
		dataSource.setPassword("postgres1");
		/*
		 * The following line disables autocommit for connections returned by this
		 * DataSource. This allows us to rollback any changes after each test
		 */
		dataSource.setAutoCommit(false);
	}

	/*
	 * After all tests have finished running, this method will close the DataSource
	 */
	@AfterClass
	public static void closeDataSource() throws SQLException {
		dataSource.destroy();
	}

	/*
	 * After each test, we rollback any changes that were made to the database so
	 * that everything is clean for the next test
	 */
	@After
	public void rollback() throws SQLException {
		dataSource.getConnection().rollback();
	}

	/*
	 * This method provides access to the DataSource for subclasses so that they can
	 * instantiate a DAO for testing
	 */
	public DataSource getDataSource() {
		return dataSource;
	}

	@Test
	public void testGetAllNationalParks() {
		List<Park> results = parkDao.getAllParks();
		assertNotNull(results);
		jdbcTemplate.update("INSERT INTO park VALUES (DEFAULT, 'TEST GET PARKS')");
		List<Park> resultsTwo = parkDao.getAllParks();

		assertNotNull(resultsTwo);
		assertEquals(results.size() + 1, resultsTwo.size());
	}

	@Test
	public void testGetParkByParkCode() {
		String parkName = "Smokey Bear";
		Park myPark = new Park();
		myPark.setParkCode(parkName);

		myPark = parkDao.searchParkByParkCode(myPark.getParkCode());

	}

	@Test
	public void testGetAllParksByNumberOfSurveys() {
		List<Park> results = parkDao.allParksByNumberOfSurveys();
		assertNotNull(results);

		jdbcTemplate.update("INSERT INTO park VALUES (DEFAULT, TEST NUMBER OF SURVEYS PER PARK");
		List<Park> resultsTwo = parkDao.allParksByNumberOfSurveys();

		assertNotNull(resultsTwo);
		assertEquals(results.size() + 1, resultsTwo.size());

	}
	
	@Test
	public void testGetForecastByParkCode() {
		List<Forecast> results = forecastDao.getForecastByParkCode(null);
		assertNotNull(results);
		jdbcTemplate.update("INSERT INTO forecast VALUES (DEFAULT, 'TEST GET FORECAST')");
		List<Forecast> resultsTwo = forecastDao.getForecastByParkCode(null);
		
		assertNotNull(resultsTwo);
		assertEquals(results.size() + 1, resultsTwo.size());
		
	} 
	
	

}
