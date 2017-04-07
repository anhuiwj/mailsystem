package com.ah.mail.utils;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;

import sun.misc.BASE64Decoder;

public class RSA {
	/**
	 * 使用RSA加密算法，使用ECB模式，使用PKCS5Padding作为填充方式。
	 */
	private static final String CIPHER_ALGORITHM = "RSA/ECB/PKCS1Padding";
	private static final String KEY_ALGORITHM = "RSA";
	private static final String PUBLIC_KEY = "publicKey";
	private static final String PRIVATE_KEY = "privateKey";
	/** RSA密钥长度必须是64的倍数，在512~65536之间。默认是1024 */
	private static final int KEY_SIZE = 2048;

	private static final String publics = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm8ub2xmicgpDCXxL9ppfOLEDlOZFrE38dWrKM/YIeva2aga9/AA6P3dY6ekIeczfSWkrntobR2m7QumxJiwgw47uDTE4ThdPix78mPJAHEqw3OdumZjlSDp6HTQb8ExlBJCoOhB244RLqoqC0/vBQdFVj7D3W+V/alAnbpT8pVXwk9UH8zxpqj+1gfn4smfmjAODb3LPgIiHXkBY+vlQzKSjhObxNr7FUXcMjZyY/qHFHJTmZ4NAIErS8lqL1J/tZ2K1lUpI4G2/5qax+urb6udnpIVtrwZ3xoWfpM65RT7j9XdyyLTtGNcqrW0fW0pc65+nTwPCxEh/8XRtzVXsjwIDAQAB";
	private static final String privates = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCby5vbGaJyCkMJfEv2ml84sQOU5kWsTfx1asoz9gh69rZqBr38ADo/d1jp6Qh5zN9JaSue2htHabtC6bEmLCDDju4NMThOF0+LHvyY8kAcSrDc526ZmOVIOnodNBvwTGUEkKg6EHbjhEuqioLT+8FB0VWPsPdb5X9qUCdulPylVfCT1QfzPGmqP7WB+fiyZ+aMA4Nvcs+AiIdeQFj6+VDMpKOE5vE2vsVRdwyNnJj+ocUclOZng0AgStLyWovUn+1nYrWVSkjgbb/mprH66tvq52ekhW2vBnfGhZ+kzrlFPuP1d3LItO0Y1yqtbR9bSlzrn6dPA8LESH/xdG3NVeyPAgMBAAECggEADEHEjURDB33PMFvbDhevDiK/CWPkb13jUsmIBvaATExEparKH51U99FH6X8v74Uyu+/OQr0eEEw9M1J3YW1vVnNUPy10JJCo7WUOsmm8qX0m1PpQNT1WLIyNNub2m70m5WkMEyVgdR3fZhdnm43e8nKprJhbnZs8nvyXXZfTGJ69/5hSvEvukL0A5+dvFid4v8oBPIGCzuv64B2gzWGjqE2nChMK3wdYpvAEA9aUZZFlqahN97VZWgTjw5WxZ046MuY/3DgPPGRhkUGUtKhd5C4vYuvfU70cDKfn53rJInCe5h6yIS7frN2WzoURGwh2StVIJA1GMjslMfRzb0XJYQKBgQD7dkCCif/4uvoG6kEG2o4GD4t0vbgNRdotrUB5TwZgDz/1Yj1wX+V4uQZ/9LysrooOVUesIFdZC+5m8EMOxW8gcJIWMzyn/NM3Uw/pgewxu+HxhhM9Yrb1BhuTJ/L7kdTxBlxfsQezs0znKz/kAl3BOF++QoTNObDW1/QPZM4zPQKBgQCem2Eqa3yliAUN4JfT+Um+wqNNVA0DvzW1cQYu9rOIxhEZysamq3FyBKU7LU0ktX1v7IqdYWvM5S5B4XLMDdGYRzokhgEkvUrL0mPX2kHdZW9Wr0PNaa6nAid9IF/IKn0lo/RVoXUs5cZ09JQgh+pblhN5Xg0/DJx0nRgIbTxruwKBgBRV99mWt3CyDk5I24FmY13yG+ERBrVsFLzk6fXlgip6kT2S+E0CNFiS/geTDz8XzmpiUy2EYAv/fwQsIgArz1TcRbQt6JXdSGeM/BhyPVu4SglyQlQQi6M9HzXDYU8e+A2V6hqDApBxy6JWSRBzcImTuYp1bq/6HmcBh+dGy7YxAoGBAJVEikeP7TkkMA2FZ555KGw9Zc7q4Wy7UWK3QiiEySZZsdJiQl6tTxENSivNUKLRo4HoTfQbsYad0dDyykU8ZBs6PYAOFZlsBK6aDJkisYYZZpVgUSFK6rIGlv9trncFdc4s5VCJqWtdvE5pt9Z905PqQ92fJDxINB6TkgCsPYbtAoGBAI68qrzV2riLg6dJts9xt8hVRJnQQgrJas/D+pFJQJsBeOAxACOmDZjsB2/6+kse52OIxi67WmKClMu7awtsQ+R7PNoVzcrxY6XtzRYMATfX0i79ddo+3HIkg+bpLvnjIDENXTPLOAAoa1E44JM32NVLBcdVVpIhPGsWe5LIE8Yr";

	/**
	 * 生成密钥对。注意这里是生成密钥对KeyPair，再由密钥对获取公私钥
	 * 
	 * @return
	 */
	public static Map<String, byte[]> generateKeyBytes() {
		try {
			KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(KEY_ALGORITHM);
			keyPairGenerator.initialize(KEY_SIZE);
			KeyPair keyPair = keyPairGenerator.generateKeyPair();
			RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
			RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
			Map<String, byte[]> keyMap = new HashMap<String, byte[]>();
			keyMap.put(PUBLIC_KEY, publicKey.getEncoded());
			keyMap.put(PRIVATE_KEY, privateKey.getEncoded());
			return keyMap;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 还原公钥，X509EncodedKeySpec 用于构建公钥的规范
	 * 
	 * @param keyBytes
	 * @return
	 */
	public static PublicKey restorePublicKey(byte[] keybytes) {
		X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(BASE64Decoder(publics));
		try {
			KeyFactory factory = KeyFactory.getInstance(KEY_ALGORITHM);
			PublicKey publicKey = factory.generatePublic(x509EncodedKeySpec);
			return publicKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 还原私钥，PKCS8EncodedKeySpec 用于构建私钥的规范
	 * 
	 * @param keyBytes
	 * @return
	 */
	public static PrivateKey restorePrivateKey(byte[] keybytes) {
		PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(BASE64Decoder(privates));
		try {
			KeyFactory factory = KeyFactory.getInstance(KEY_ALGORITHM);
			PrivateKey privateKey = factory.generatePrivate(pkcs8EncodedKeySpec);
			return privateKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 加密
	 * 
	 * @param key
	 * @param plainText
	 * @return
	 */
	public static String encode(PublicKey key, String plainText) {
		try {
			Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] encode = cipher.doFinal(plainText.getBytes("UTF-8"));
			return Base64.encode(encode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 解密
	 * 
	 * @param key
	 * @param encodedText
	 * @return
	 */
	public static byte[] decode(PrivateKey key, String encodedText) {
		try {
			byte[] decode = Base64.decode(encodedText);// 用Base64解密
			Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] decryptedData = cipher.doFinal(decode);
			return decryptedData;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将String通过BASE64Decoder转化为Key字节
	 * 
	 * @param keyString
	 * @return
	 */
	public static byte[] BASE64Decoder(String keyString) {
		try {
			byte[] keys = new BASE64Decoder().decodeBuffer(keyString);
			return keys;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) throws IOException, Base64DecodingException {
		String str = "Hello,World!✨";
		System.out.println("加密前：" + str);
		Map<String, byte[]> keyMap = RSA.generateKeyBytes();
		// 加密
		PublicKey publicKey = RSA.restorePublicKey(keyMap.get(PUBLIC_KEY));
		String encodedText = RSA.encode(publicKey, str);
		System.out.println("RSA encoded: " + encodedText);
		// 解密
		PrivateKey privateKey = RSA.restorePrivateKey(keyMap.get(PRIVATE_KEY));
		byte[] decryResult = RSA.decode(privateKey, encodedText);
		System.out.println("RSA decoded: " + new String(decryResult));

	}

}
