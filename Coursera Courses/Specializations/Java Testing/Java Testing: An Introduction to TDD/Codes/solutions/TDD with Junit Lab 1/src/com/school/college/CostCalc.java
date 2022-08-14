package com.school.college;

class CostCalc {
	
	public int calcCost(Student stu) {
		int cost = weeksCost(stu.getWeeksOfClass());
		cost += residentCost(cost,stu.getStateRes());
		cost -= yearsDiscount(stu.getYearsStudent());
		return cost;
	}
	
	int weeksCost(int weeks) {
		int cost = 0;
		switch(weeks) {
			case 3:
				cost = 500;
				break;
			case 4:
				cost = 700;
				break;
			case 6:
				cost = 1100;
				break;
			case 8:
				cost = 1500;
				break;
			case 12:
				cost = 2000;
				break;
		}
		return cost;
	}
	
	int residentCost(int currentCost,boolean stateRes) {
		int additional = 0;
		if(!stateRes) {
			additional = (int) (currentCost*0.1);
		}
		return additional;
	}
	
	int yearsDiscount(int yearsAttended) {
		int discount = yearsAttended*50;
		return discount;
	}
	

}
