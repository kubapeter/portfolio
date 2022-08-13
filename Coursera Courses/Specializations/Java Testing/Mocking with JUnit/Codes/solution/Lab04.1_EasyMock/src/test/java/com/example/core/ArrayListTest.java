package com.example.core;

import static org.easymock.EasyMock.expect;
import static org.easymock.EasyMock.mock;
import static org.easymock.EasyMock.replay;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import java.util.ArrayList;
import org.junit.jupiter.api.Test;

public class ArrayListTest {

	@Test
	public void test() {
		ArrayList<Integer> mockList = mock(ArrayList.class);
		expect(mockList.add(15)).andReturn(true);
		expect(mockList.add(10)).andReturn(true);
		expect(mockList.size()).andReturn(2);
		expect(mockList.get(0)).andReturn(15);
		replay(mockList);

		mockList.add(15);
		mockList.add(10);
		// below will throw exception because it's not mocked
		// mockList.add(30);

		assertEquals(mockList.size(), 2);
		assertTrue(mockList.get(0) == 15);
		
	}
}
