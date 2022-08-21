package com.student.core;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.aggregator.AggregateWith;
import org.junit.jupiter.params.provider.CsvSource;

class StudentTest {


	@ParameterizedTest(name="Test getId Person[{0}, {1}, {2}, {3}]")
	@CsvSource( {"1, tony, stark, engineering"})
	void testGetId(@AggregateWith(StudentAggregator.class) Student student) {
		assertEquals( student.getId(), 1);
	}
	
	@ParameterizedTest(name="Test getSurname Person[{0}, {1}, {2}, {3}]")
	@CsvSource( {"1, tony, stark, engineering"})
	void testGetSurname(@AggregateWith(StudentAggregator.class) Student student) {
		assertEquals( student.getSurname(), "stark");
	}
	
	@ParameterizedTest(name="Test getFirstName Person[{0}, {1}, {2}, {3}]")
	@CsvSource( {"1, tony, stark, engineering"})
	void testGetFirstName(@AggregateWith(StudentAggregator.class) Student student) {
		assertEquals( student.getFirstName(), "tony");
	}


	@ParameterizedTest(name="Test getSurname Person[{0}, {1}, {2}, {3}]")
	@CsvSource( {"1, tony, stark, engineering"})
	void testGetDept(@AggregateWith(StudentAggregator.class) Student student) {
		assertEquals( student.getDept(), "engineering");
	}


}
