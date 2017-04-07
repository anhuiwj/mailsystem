package com.ah.mail.utils;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.UUID;

import com.google.gson.Gson;

public class App {
	public static void main(String[] args) {
		// 待加密内容
		String s = "《男子打飞的抢劫 小贼很气：你们上海人都不带现金！》";
		System.out.println("待加密内容：" + s);
		// 生成DES密码
		UUID uuid = UUID.randomUUID();
		String password = uuid.toString().substring(0, 8);
		// 1.des加密
		s = DES.encode(password, s);
		System.out.println("DES加密后：" + s);

		Gson gson = new Gson();
		// 2.RSA加密
		PublicKey publicKey = RSA.restorePublicKey(null);
		password = RSA.encode(publicKey, password);// 用RSA公钥对DES密钥加密成密文
		Text text = new Text(password, s);
		String encodedText = gson.toJson(text);
		System.out.println("发送内容：" + encodedText);
		// 发送
		// -------------------------------------------------------------------
		// 接收
		System.out.println("接收内容：" + encodedText);
		text = gson.fromJson(encodedText, Text.class);
		// 3.RSA解密
		PrivateKey privateKey = RSA.restorePrivateKey(null);
		byte[] RSAdecryResult = RSA.decode(privateKey, text.getHead());// 用RSA私钥把DES密钥密文解密成明文
		password = new String(RSAdecryResult);
		// 4.DES解密
		byte[] DESdecryResult = DES.decode(password, text.getBody());
		System.out.println("DES解密后：" + new String(DESdecryResult));
	}
}
