package com.secure.secret;

 

public class BasicEncryption {
public static final String CLEARANCE_LEVEL = "Top Secret";
public static int randomEncry;

	private BasicEncryption() {}   //yes argument constructor

	public static String encrypt(String stringIn) {

		StringBuilder sb = new StringBuilder();
		
		for (int i = 0; i < stringIn.length(); i++) {
			int k = stringIn.charAt(i);
			k += 3;
			char encrypted = (char) k;
			sb.append(encrypted);
		}
			String finshed = sb.reverse().toString();
		return finshed;
	}

	public static String decrypt(String stringIn) {

		StringBuilder june = new StringBuilder("");

		for (int i = 0; i < stringIn.length(); i++) {
			int k = stringIn.charAt(i);
			k -= 3;
			char decrypted = (char) k;
			june.append(decrypted);
		}
			String come = june.reverse().toString();
		return come;
	}
	
	public static String decryptWithoutSB(String stringIn) {
		return null;
	}
	
}
