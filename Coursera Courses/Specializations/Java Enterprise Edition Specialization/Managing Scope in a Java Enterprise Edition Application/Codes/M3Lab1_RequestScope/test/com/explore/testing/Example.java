package com.explore.testing;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Random;

import org.junit.jupiter.api.Test;

class Example {

	@Test
	void test() {

		char[] unencryptedName = "joeLouis".toCharArray();
		String vowels = "AEIOUaeiou";

		for (int i = 0; i < unencryptedName.length; i++) {

			char c = unencryptedName[i];
			System.out.println("c:" + c);
			if (vowels.indexOf(c) != -1) {
				System.out.println("inside index of, c is:" + c);
				Random rand = new Random();
				int x = rand.nextInt((123 - 65) + 1) + 65;
				System.out.println("x:" + x);
				unencryptedName[i] = (char) x;
				System.out.println("after replacing, c is:" + c);
			}
		}
		
		for (char m : unencryptedName) {
			System.out.print(m);
		}

		System.out.println(unencryptedName);
	}

}
