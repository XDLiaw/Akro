package core.util;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class AESEncrypter {
	
	public static final String KEY = "SYSVIN2016";
	protected static Logger log = LogManager.getLogger(AESEncrypter.class);

	public static String encrypt(String key, String plainText) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(key.getBytes()));
			SecretKey skey = kgen.generateKey();
			byte[] raw = skey.getEncoded();
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
			byte[] encrypt = cipher.doFinal(plainText.getBytes());
			String encrypted = new BASE64Encoder().encodeBuffer(encrypt);
			return encrypted;
		} catch (Exception e) {
			log.error("", e);
			return null;
		}
	}
	
	public static String decrypt(String key, String cipherText) {
		try {
			byte[] b = new BASE64Decoder().decodeBuffer(cipherText);
			KeyGenerator kgen2 = KeyGenerator.getInstance("AES");
			kgen2.init(128, new SecureRandom(key.getBytes()));
			SecretKey skey2 = kgen2.generateKey();
			byte[] raw2 = skey2.getEncoded();
			SecretKeySpec skeySpec2 = new SecretKeySpec(raw2, "AES");
			Cipher cipher2 = Cipher.getInstance("AES");
			cipher2.init(Cipher.DECRYPT_MODE, skeySpec2);
			byte[] decrypt = cipher2.doFinal(b);
			return new String(decrypt);
		} catch (Exception e) {
			log.error("", e);
			return null;
		}
	}
	
	public static void main(String[] args) throws Exception {
		String text = "abc";
		
		String encryptText = encrypt(KEY, text);
		String decryptText = decrypt(KEY, encryptText);
		System.out.println("["+encryptText+"]");
		System.out.println("["+decryptText+"]");
	}
}
