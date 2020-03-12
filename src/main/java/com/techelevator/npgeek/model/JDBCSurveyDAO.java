package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Survey> getAllSurveys() {
		List<Survey> surveys = new ArrayList<Survey>();
		String sqlGetAllSurveys = "SELECT * FROM survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllSurveys);
		while(results.next()) {
			Survey theSurvey = mapRowToSurvey(results);
			surveys.add(theSurvey);
		}
		return surveys;
	}
	
	@Override
	public Survey submitSurvey(Survey surv) {
		String sqlCreateSurvey = "INSERT INTO survey_result VALUES(?, ?, ?, ?, ?, ?)";
		surv.setSurveyId(getNextId());
		jdbcTemplate.update(sqlCreateSurvey, surv.getSurveyId(), surv.getParkCode(), surv.getEmailAddress(), surv.getState(), surv.getActivityLevel(), surv.getSubmitDate());
		return surv;
	}

	@Override
	public int getNextId() {
		int id;
		String sqlNextId = "SELECT nextval('seq_surveyid'::regclass)";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlNextId);
		results.next();
		id = results.getInt(1);
		return id;
	}
	
	private Survey mapRowToSurvey(SqlRowSet results) {
		Survey returnSurvey = new Survey();
		returnSurvey.setSurveyId(results.getInt("surveyid"));
		returnSurvey.setParkCode(results.getString("parkcode"));
		returnSurvey.setEmailAddress(results.getString("emailaddress"));
		returnSurvey.setState(results.getString("state"));
		returnSurvey.setActivityLevel(results.getString("activitylevel"));
		returnSurvey.setSubmitDate(results.getDate("submitdate").toLocalDate());
		return returnSurvey;
	}
	

}

	
