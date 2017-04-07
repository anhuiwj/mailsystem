package com.ah.mail.utils;

import java.io.UnsupportedEncodingException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.UUID;

import com.google.gson.Gson;

public class EnCryptUtils {
	private static final String password = "jiejie12";
	public static String encode(String str){
		UUID uuid = UUID.randomUUID();
		// 1.des加密
		str = DES.encode(password, str);
		System.out.println("DES加密后：" + str);

		Gson gson = new Gson();
		// 2.RSA加密
		PublicKey publicKey = RSA.restorePublicKey(null);
		String pass = RSA.encode(publicKey, password);// 用RSA公钥对DES密钥加密成密文
		Text text = new Text(pass, str);
		String encodedText = gson.toJson(text);
		return encodedText;
	}
	public static String decode(String encodedText){
		String res = "";
		try {
			Gson gson = new Gson();
			Text text = gson.fromJson(encodedText, Text.class);
			// 3.RSA解密
			PrivateKey privateKey = RSA.restorePrivateKey(null);
			byte[] RSAdecryResult = RSA.decode(privateKey, text.getHead());// 用RSA私钥把DES密钥密文解密成明文
			String passd = new String(RSAdecryResult);
			// 4.DES解密
			byte[] DESdecryResult = DES.decode(passd, text.getBody());
			res = new String(DESdecryResult,"utf-8");
			System.out.println("DES解密后：" + res);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public static void main(String[] args) {
		EnCryptUtils.decode("{\"head\":\"CvBqaqaK5pqaWyXK78ur+ZELd7/WhSBBiyxG0lq/pExlZsAmcjUngz/TifUTk+UFtihZXPCp02Gy\noEEFNhAPO1sjjzbkBXqp8FaDX4WmECFFjjvJbmZSAYKDXvbZtMw+r/b04rhDA83zwgw7KMJjLF5i\nwGNmDj7ogrsg2I0KWF7c/Rl2Zwc2TH4813Ign8J6ljME4nHje8br0g+D1m9qn0C+TJJyrlAfJifj\nTepOn4zFmGN3nApTR6p5EjjW2gWDpjecDl7jNMiQlzP2BtcANlGiQpPmvvVviSVpWdSDpjtjFsq7\nhWbIGPCy/b0mD+bM3AJgMy2y/6ck3I3SfqQH/w\u003d\u003d\",\"body\":\"zzQQ/6syOV/DoKh24jDWtGiSQZPd3li6Pegl3xyc9tYeOIMve847xbRkKJhfNHehWzWiROl3anQu\nQqC7rJjdxw\u003d\u003d\"}");
	}
}
