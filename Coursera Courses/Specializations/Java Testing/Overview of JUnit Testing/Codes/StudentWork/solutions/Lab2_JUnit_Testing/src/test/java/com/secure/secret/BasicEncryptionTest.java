package com.secure.secret;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class BasicEncryptionTest {

	@Test
	void testEncrypt() {
		String expected = "gourZ#roohK";
		String actual = BasicEncryption.encrypt("Hello World");
		assertEquals(expected,actual);
	}

	@Test
	void testDecrypt() {
		String expected = "gourZ#roohK";
		String actual = BasicEncryption.encrypt("Hello World");
		assertEquals(expected,actual);
	}

	@Test
	void testDecryptWithoutSB() {
		String expected = "Hello World";
		String actual = BasicEncryption.decrypt("gourZ#roohK");
		assertEquals(expected,actual);
	}

}
