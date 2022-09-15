package com.mvc.example;

import java.util.HashMap;
import java.util.Map;

class LocalRepository {
	
	private static Map<Long,Contact> contacts = new HashMap<>();
	
	static void addContact(Contact contact) {
		contacts.put(contact.getId(), contact);
	}
	
	static Contact getContact(long id) {
		return contacts.get(id);
	}

}
