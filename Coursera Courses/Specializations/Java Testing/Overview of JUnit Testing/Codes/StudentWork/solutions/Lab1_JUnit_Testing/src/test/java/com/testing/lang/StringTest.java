package com.testing.lang;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class StringTest {

	@Test
	void testLength() {
		String s = "JUnit Rules";
		assertTrue(11 == s.length());
	}
	@Test
	void testSubString() {
		String s = "JUnit Rules";
		assertEquals(s.substring(1,5),"Unit");
	}

}
