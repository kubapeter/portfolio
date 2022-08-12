package com.not.secret;

import static com.secure.secret.BasicEncryption.*;

import java.util.Scanner;

	public class EncryptorClient {
		
		public static void main(String[] args) {
			Scanner s1 = new Scanner(System.in);
			
			System.out.println(CLEARANCE_LEVEL);
			System.out.println("What would you like to encrypt?");
			String want = s1.nextLine();
			
			System.out.println(CLEARANCE_LEVEL);
			
			String ecrypted = encrypt(want);
			System.out.println(ecrypted);
			
			System.out.println(CLEARANCE_LEVEL);
			
			String decrypted = decrypt(ecrypted);
			System.out.println(decrypted);
		
		
		
		
		
		}
	}


