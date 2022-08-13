package com.secure.secret;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class EncryptionTest {

	@Test
	void testEncrypt() {
		assertAll( () -> assertEquals("Khoor#Zroug", BasicEncryption.encrypt("Hello World")),
			   () ->  assertEquals("Dssoh", BasicEncryption.encrypt("Apple")) );
	}

	@Test
	void testDecrypt() {
		assertAll( () -> assertEquals("Hello World", BasicEncryption.decrypt("Khoor#Zroug")),
             		   () ->  assertEquals("WrIte ThIs GRoSs", BasicEncryption.decrypt("ZuLwh#WkLv#JUrVv")),
			   () ->  assertNotEquals("Apple", BasicEncryption.decrypt("Apple")) );
	}
	
	@Test
	void encryptExceptionTestShort() {
		try {
			BasicEncryption.encrypt("a");
			assertTrue(false);
		}
		catch(InvalidLengthException e) {
			assertTrue(e instanceof InvalidLengthException);
		}
	}
	
	
	@Test
	void encryptExceptionTestLong() {
		try {
			BasicEncryption.encrypt("This is a much too long line, really really really really really really really really really really really really really really really really really really really really really really really long.");
			assertTrue(false);
		}
		catch(InvalidLengthException e) {
			assertTrue(e instanceof InvalidLengthException);
		}
	}

}
