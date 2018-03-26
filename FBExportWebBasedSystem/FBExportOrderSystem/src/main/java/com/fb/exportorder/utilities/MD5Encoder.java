package com.fb.exportorder.utilities;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encoder {
	public String encode(String text) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
			
			md.update(text.getBytes(), 0 , text.length());
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new BigInteger(1, md.digest()).toString(16);
	}
}
