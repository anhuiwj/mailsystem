package com.ah.manager.util;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.UUID;

/**
 * 封装各种生成唯一性ID算法的工具类.
 * @author Yoda
 */
@Service
@Lazy(false)
public class IdGen {

	private static SecureRandom random = new SecureRandom();
	
	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 使用SecureRandom随机生成Long. 
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}


    /**
     * 复诊编号生成规则
     * @param personcardNo
     * @param inputYear
     * (入学年份后两位+身份证号码后10位)去掉身份证最后一位的字符串转换为32位后再追加身份证最后一位
     * @return
     */
    public static String reviewId(String personcardNo,String inputYear){
        String reviewId = "";
        String code = inputYear.substring(2,4).concat(personcardNo.substring(8,18));
        BigInteger big = new BigInteger(code.substring(0, code.length() - 1));
        reviewId = big.toString(32).concat(code.substring(code.length()-1,code.length()));
        return reviewId;
    }

	public static void main(String[] args) {
		System.out.println(IdGen.uuid());
		System.out.println(IdGen.uuid().length());
	}

}
