package com.mvc.example;

 class Contact {

	private long id;
	private String first_name;
	private String last_name;

	Contact(long id, String first_name, String last_name){
		this.id = id;
		this.first_name = first_name;
		this.last_name  = last_name;
	}
	
	public String getFirst_name() {
		return first_name;
	}

	public String getLast_name() {
		return last_name;
	}
	
	public long getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Contact id=" + id + "\tfirst_name=" + first_name + "\tlast_name=" + last_name;
	}

	
	
}
