package com.wardmate.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    public static String getMD5String(String input){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(input.getBytes());
            byte[] bytes = md.digest();
            int temp;
            StringBuffer buffer = new StringBuffer("");
            for(int i = 0; i < bytes.length; i++){
                temp = bytes[i];
                if (temp < 0) temp += 256;
                if (temp < 16) buffer.append("0");
                buffer.append(Integer.toHexString(temp));
            }
            return buffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }
}
