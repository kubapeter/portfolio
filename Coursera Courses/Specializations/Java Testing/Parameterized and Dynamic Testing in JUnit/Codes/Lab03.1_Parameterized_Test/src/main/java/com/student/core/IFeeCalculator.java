package com.student.core;

public interface IFeeCalculator {
	public double setFee( int feeType);
	public double feesDue();
	public void payFee( double fee);
}