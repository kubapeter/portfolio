package com.student.core;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import static org.easymock.EasyMock.createMock;
import static org.easymock.EasyMock.expect;
import static org.easymock.EasyMock.replay;

import org.easymock.EasyMock;
import org.junit.*;

class StudentRegistrationTest {

	@Test
	public void test() {
		IFeeProvider feeProvider = createMock(IFeeProvider.class);
		// feed it to the business object
		Student student = new Student(100, "Bruce", "Banner", "Engineering");
		StudentRegistration studentRegistration = new StudentRegistration(student, feeProvider);

		// public String setFee(Double fee)
		// public Double feesDue()
		// public String payFee(Double fee) 
		
		feeProvider.setFee(100.00);
		expect(feeProvider.feesDue()).andReturn(100.00);
		feeProvider.payFee(75.00);
		expect(feeProvider.feesDue()).andReturn(25.00);
		replay(feeProvider);

		assertEquals(studentRegistration.setFee(100.00), "fee set");
		assertEquals(studentRegistration.feesDue(), 100.00, 0.001);
		assertEquals(studentRegistration.payFee(75.00), "fee payment");
		assertEquals(studentRegistration.feesDue(), 25.00, 0.001);

		EasyMock.verify(feeProvider);
	}
}
