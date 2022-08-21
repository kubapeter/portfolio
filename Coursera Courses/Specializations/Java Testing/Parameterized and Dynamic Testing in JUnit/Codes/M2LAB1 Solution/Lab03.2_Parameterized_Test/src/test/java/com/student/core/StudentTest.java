package com.student.core;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.aggregator.AggregateWith;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

class StudentTest {
	Student student = new Student();

	@ParameterizedTest(name="Test setId {0}")
	@CsvSource( {"1","2","0","10001"})
	void setIdTest(String idNum) {
		assertEquals(ReturnValue.VALID, student.setId(Integer.parseInt(idNum)));
	}
	
	@ParameterizedTest(name="Test setDOB {0}")
	@MethodSource("getDOBs")
	void setDOBTest(String DOB) {
		String[] nums = DOB.split(",");
		ReturnValue actual = student.setDOB(Long.parseLong(nums[0]), Long.parseLong(nums[1]), Long.parseLong(nums[2]));
		assertEquals(ReturnValue.VALID, actual);
	}
	
	@ParameterizedTest(name="Test setDept {0}")
	@ValueSource( strings = {"engineering","computer science","pro gamer"})
	void setDeptTest(String dept) {
		assertEquals(ReturnValue.VALID, student.setDept(dept));
	}

	private static String[] getDOBs() {
		return new String[] {"12,22,2001","2,4,2016","10,12,1990"};
	}

}
