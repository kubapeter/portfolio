package com.example.core;

import static org.easymock.EasyMock.createMock;

import static org.easymock.EasyMock.expect;
import static org.easymock.EasyMock.replay;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.easymock.EasyMock;
import org.junit.jupiter.api.Test;

public class CalcTest {

	@Test
	public void test() {
		ICalc calc = EasyMock.createMock(ICalc.class);
		// feed it to the business object
		MathUtils mathUtils = new MathUtils(calc);
		
		expect(calc.add(1, 1)).andReturn(2);
		expect(calc.multiply(10, 10)).andReturn(100);
		replay(calc);

		assertEquals(mathUtils.add(1, 1), 2);
		assertEquals(mathUtils.multiply(10, 10), 100);
		EasyMock.verify(calc);
	}
}