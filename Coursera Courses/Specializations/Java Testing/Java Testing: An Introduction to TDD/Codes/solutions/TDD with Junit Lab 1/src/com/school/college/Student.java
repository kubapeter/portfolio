package com.school.college;

class Student {
	
	private String name;
	private int age;
	private int yearsStudent;
	private boolean stateRes;
	private int weeksOfClass;
	
	Student(String nameIn,int ageIn,int yearsStuIn,boolean stateResIn,int weeksOfClassIn){
		name = nameIn;
		age = ageIn;
		yearsStudent = yearsStuIn;
		stateRes = stateResIn;
		weeksOfClass = weeksOfClassIn;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	int getAge() {
		return age;
	}

	void setAge(int age) {
		this.age = age;
	}

	int getYearsStudent() {
		return yearsStudent;
	}

	void setYearsStudent(int yearsStudent) {
		this.yearsStudent = yearsStudent;
	}

	boolean getStateRes() {
		return stateRes;
	}

	void setStateRes(boolean stateRes) {
		this.stateRes = stateRes;
	}

	int getWeeksOfClass() {
		return weeksOfClass;
	}

	void setWeeksOfClass(int weeksOfClass) {
		if(weeksOfClass == 3 || weeksOfClass == 4 || weeksOfClass == 6|| weeksOfClass == 8 || weeksOfClass == 12) {
		this.weeksOfClass = weeksOfClass;
		}
	}
	

}
