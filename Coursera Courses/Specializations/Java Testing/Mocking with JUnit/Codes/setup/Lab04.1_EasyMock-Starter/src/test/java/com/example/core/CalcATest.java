package com.example.core;

import static org.easymock.EasyMock.expect;
import static org.easymock.EasyMock.mock;
import static org.easymock.EasyMock.replay;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.easymock.EasyMockSupport;
import org.easymock.Mock;
import org.easymock.TestSubject;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CalcATest {

	@Mock
	private ICalc calcMock;

	@TestSubject
	private MathUtils mathUtils = new MathUtils(calcMock);

	@BeforeEach
	public void setup() {
		
	}

	@Test
	public void test() {
		
	}
}