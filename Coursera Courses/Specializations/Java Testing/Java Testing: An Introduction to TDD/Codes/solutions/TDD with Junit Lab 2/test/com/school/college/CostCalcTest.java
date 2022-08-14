package com.school.college;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
 

import static org.hamcrest.CoreMatchers.equalTo;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class CostCalcTest {

	static Student stu1;
	static Student stu2;
	static Student stu3;
	static Student stu4;
	static Student stu5;
	static CostCalc calc;
	static ArrayList<Student> students = new ArrayList<Student>();
	static AClass aClass;
	
	@BeforeAll
	static void setUp() {
		stu1 = new Student("George Frank",24,3,true);
		calc = new CostCalc();
		stu2 = new Student("Hue",24,3,true);
		stu3 = new Student("James",25,5,false);
		stu4 = new Student("Samuel",22,1,true);
		stu5 = new Student("Kyle",21,2,false);
		students.add(stu2);
		students.add(stu3);
		students.add(stu4);
		students.add(stu5);
		aClass = new AClass("science",students,12);
	}
	
	@Test
	void calcCostTest() {
		assertThat(calc.calcCost(aClass).get(stu2),equalTo(1850));
		assertThat(calc.calcCost(aClass).get(stu3),equalTo(1950));
		assertThat(calc.calcCost(aClass).get(stu4),equalTo(1950));
		assertThat(calc.calcCost(aClass).get(stu5),equalTo(2100));
	}
	
	@Test
	void weeksCostTest() {
		int expected = 2000;
		int actual = calc.weeksCost(12);
		assertEquals(expected,actual);
	}
	
	@Test
	void residentTest() {
		int expected = 70;
		int actual = calc.residentCost(700, false);
		assertEquals(expected,actual);
	}
	
	@Test
	void yearsDisTest() {
		int expected = 150;
		int actual = calc.yearsDiscount(3);
		assertEquals(expected,actual);
	}
	
	@Test
	void classSizeDiscountTest() {
		double expected = 150;
		double actual = calc.classSizeDiscount(25, 1500);
		assertEquals(expected,actual);
	}
}
