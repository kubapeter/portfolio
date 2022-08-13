package com.example.core;

public class MathUtils {
	private ICalc calc;
	
	public MathUtils(ICalc c) {
		this.calc = c;
	}
	public int add(int i, int j) {
		return this.calc.add(i, j);
	}
	public int multiply(int i, int j) {
		return this.calc.multiply(i, j);
	}
}