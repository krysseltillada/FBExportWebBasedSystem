package com.fb.exportorder.utilities;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

public class UploadImage {
	
	public static String uploadProfileImage (String hashValue, String contextPath, MultipartFile profileImage) {
		
		try {

			byte[] imageBytes = profileImage.getBytes();
			
			Map <String, String> imageTypes = new HashMap<String, String>() {{
				put("image/jpeg", ".jpg");
				put("image/png", ".png");
			}};
			
			String profileImageLink = StringUtils.EMPTY;
			
			String profileImageFilename = DigestUtils.md5Hex(hashValue) + imageTypes.get(profileImage.getContentType());
			String profileImageFilePath = contextPath + File.separator + profileImageFilename;
			Path path = Paths.get(profileImageFilePath);
			Files.write(path, imageBytes);
			
			profileImageLink = "/profile-img/" + profileImageFilename;
			
			return profileImageLink;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return null;
		
	}
	
	public static String uploadProductImage (String hashValue, MultipartFile productImage) {
		
		try {

			byte[] imageBytes = productImage.getBytes();
			
			Map <String, String> imageTypes = new HashMap<String, String>() {{
				put("image/jpeg", ".jpg");
				put("image/png", ".png");
			}};
			
			String productImageLink = StringUtils.EMPTY;
			
			String productImageFilename = DigestUtils.md5Hex(hashValue) + imageTypes.get(productImage.getContentType());
			String productImageFilePath = FileSystems.getDefault().getPath("src\\main\\webapp\\products") + File.separator + productImageFilename;
			Path path = Paths.get(productImageFilePath);
			Files.write(path, imageBytes);
			
			productImageLink = "/products/" + productImageFilename;
			
			return productImageLink;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return null;
		
	}

	
	public static String uploadProductImageNonHash (String value, MultipartFile productImage) {
		
		try {

			byte[] imageBytes = productImage.getBytes();
			
			Map <String, String> imageTypes = new HashMap<String, String>() {{
				put("image/jpeg", ".jpg");
				put("image/png", ".png");
			}};
			
			String productImageLink = StringUtils.EMPTY;
			
			String productImageFilename = value + imageTypes.get(productImage.getContentType());
			String productImageFilePath = FileSystems.getDefault().getPath("src\\main\\webapp\\products") + File.separator + productImageFilename;
			Path path = Paths.get(productImageFilePath);
			Files.write(path, imageBytes);
			
			productImageLink = "/products/" + productImageFilename;
			
			return productImageLink;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return null;
		
	}

}
