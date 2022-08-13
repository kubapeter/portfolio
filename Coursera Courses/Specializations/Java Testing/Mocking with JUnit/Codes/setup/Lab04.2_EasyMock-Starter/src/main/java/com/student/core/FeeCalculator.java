package com.student.core;

public class FeeCalculator {

    private IFeeProvider feeCalc;
	
    public FeeCalculator(IFeeProvider feeCalc) {
    	super();
    	this.feeCalc = feeCalc;
    }

	public Double feesDue() {
		return this.feeCalc.feesDue();
	}

	public String payFee(Double fee) {
		this.feeCalc.payFee( fee);
		return "fees paid";
    }
	
}

/*
 * public class IncomeCalculator {

    private ICalcMethod calcMethod;
    private Position position;

    public void setCalcMethod(ICalcMethod calcMethod) {
        this.calcMethod = calcMethod;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public double calc() {
        if (calcMethod == null) {
            throw new RuntimeException("CalcMethod not yet maintained");
        }
        if (position == null) {
            throw new RuntimeException("Position not yet maintained");
        }
        return calcMethod.calc(position);
    }
}
 */
