package com.ah.mail.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import com.sun.org.apache.xml.internal.security.utils.Base64;

public class DES {
	/**
	 * 使用DES加密算法，使用ECB模式，使用PKCS5Padding作为填充方式。
	 */
	private static final String CIPHER_ALGORITHM = "DES/ECB/PKCS5Padding";

	/**
	 * 加密
	 * 
	 * @param encryptKey
	 * @param encryptString
	 * @return
	 * @throws Exception
	 */
	public static String encode(String encryptKey, String encryptString) {
		try {
			SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");// 生成加密需要的key
			Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
			cipher.init(Cipher.ENCRYPT_MODE, key);// 加密数据
			byte[] encryptedData = cipher.doFinal(encryptString.getBytes("UTF-8"));// 完成单步的加密
			return Base64.encode(encryptedData);// 用Base64加密
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 解密
	 * 
	 * @param encryptKey
	 * @param decryptString
	 * @return
	 * @throws Exception
	 */
	public static byte[] decode(String encryptKey, String decryptString) {
		try {
			byte[] decode = Base64.decode(decryptString);// 用Base64解密
			SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");// 生成解密需要的key
			Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
			cipher.init(Cipher.DECRYPT_MODE, key);// 解密数据
			byte[] decryptedData = cipher.doFinal(decode);// 完成单步的解密
			return decryptedData;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) throws Exception {
		String password = "12345678";
		String str = "Hello,World!✨";
		System.out.println("加密前：" + str);
		String result = DES.encode(password, str);
		System.out.println("加密后：" + result);
		byte[] decryResult = DES.decode(password, result);
		System.out.println("解密后：" + new String(decryResult));
	}
}
