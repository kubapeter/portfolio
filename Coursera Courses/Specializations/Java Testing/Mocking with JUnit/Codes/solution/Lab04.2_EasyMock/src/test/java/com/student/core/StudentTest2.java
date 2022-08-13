package com.student.core;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import static org.easymock.EasyMock.createMock;
import org.easymock.EasyMock;
import org.junit.*;

class StudentTest2 {

	@Test
	public void testStudent() {
		IStudentRepository mockStudent = createMock(IStudentRepository.class);
		EasyMock.expect(mockStudent.getFees(1)).andReturn(100.00);		

		//activate the mock
		EasyMock.replay(mockStudent);	
		  
		//verify call to mockStudent is made or not
		//EasyMock.verify(mock);
		assertTrue(mockStudent.getFees(1) == 100);
	}
}
