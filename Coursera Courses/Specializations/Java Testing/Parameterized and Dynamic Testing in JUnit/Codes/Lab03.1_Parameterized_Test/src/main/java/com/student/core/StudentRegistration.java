package com.student.core;

public class StudentRegistration {

	private Student student;
	private IFeeProvider feeProvider;
	
	public StudentRegistration( Student student, IFeeProvider feeProvider) {
		this.student = student;
		this.feeProvider = feeProvider;
	}
	
	public String setFee(double fee) {
		this.feeProvider.setFee(fee);
		return "fee set";
	}

	public double feesDue() {
		return this.feeProvider.feesDue();
	}

	public String payFee(double fee) {
		this.feeProvider.payFee(fee);
		return "fee payment";
	}
}
