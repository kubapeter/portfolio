package com.student.core;

import java.util.stream.Stream;

import org.junit.jupiter.api.extension.ExtensionContext;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.ArgumentsProvider;

public class StudentArgumentsProvider implements ArgumentsProvider{

	@Override
	public Stream<? extends Arguments> provideArguments(ExtensionContext context) throws Exception {
		
		return Stream.of(Arguments.of(new Student(524,"Micheal","Smith","computer science",4,11,1940)), 
				Arguments.of(new Student(5600,"Micheal","Scott","computer science",12,6,1980)),
				Arguments.of(new Student(8500,"Micheal","Jordan","computer science",9,14,2018)));
	}

}
