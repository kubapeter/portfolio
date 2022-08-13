package com.secure.secret;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class EncryptionTest {

	@Test
	void testEncrypt() {
		assertAll( () -> assertEquals("Khoor#Zroug", BasicEncryption.encrypt("Hello World")),
			   () ->  assertEquals("Dssoh", BasicEncryption.encrypt("Apple"))
             );
	}

	@Test
	void testDecrypt() {
		assertAll( () -> assertEquals("Hello World", BasicEncryption.decrypt("Khoor#Zroug")),
             () ->  assertEquals("WrIte ThIs GRoSs", BasicEncryption.decrypt("ZuLwh#WkLv#JUrVv")),
             () ->  assertNotEquals("d", BasicEncryption.decrypt("d"))
             );
	}

}
