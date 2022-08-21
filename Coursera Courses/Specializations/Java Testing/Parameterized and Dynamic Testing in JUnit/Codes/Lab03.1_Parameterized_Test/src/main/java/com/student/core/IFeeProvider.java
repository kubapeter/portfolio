package com.student.core;

public interface IFeeProvider {
	public void setFee( double fee);
	public double feesDue();
	public void payFee( double fee);
}