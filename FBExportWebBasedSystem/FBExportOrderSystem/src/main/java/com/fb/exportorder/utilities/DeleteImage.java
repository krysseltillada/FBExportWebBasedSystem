package com.fb.exportorder.utilities;

import java.io.File;
import java.nio.file.FileSystems;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

public class DeleteImage {
	
	public static void deleteProductImage (String filename) {
		
		List <String> fileTypes = new ArrayList<String>() {{
			add(".png");
			add(".jpg");
		}};
		
		File deletedFile = null;
		
		for (String fileType : fileTypes) {
		
			
			deletedFile	= FileSystems.getDefault().getPath("src\\main\\webapp\\products\\" + DigestUtils.md5Hex(filename) + fileType).toFile();
			
			System.out.println(deletedFile.getAbsolutePath());
			
			if (deletedFile.exists()) {
				deletedFile.delete();
				break;
			}
		
		}
						
	}
	
	public static void deleteProductImageNonHash (String filename) {
		
		List <String> fileTypes = new ArrayList<String>() {{
			add(".png");
			add(".jpg");
		}};
		
		File deletedFile = null;
		
		for (String fileType : fileTypes) {
		
			
			deletedFile	= FileSystems.getDefault().getPath("src\\main\\webapp\\products\\" + filename + fileType).toFile();
			
			System.out.println(deletedFile.getAbsolutePath());
			
			if (deletedFile.exists()) {
				deletedFile.delete();
				break;
			}
		
		}
						
	}
	
	public static void deleteProductImageNonHashNonType (String filename) {
		
			File deletedFile = null;
			
			deletedFile	= FileSystems.getDefault().getPath("src\\main\\webapp\\products\\" + filename).toFile();
				
			System.out.println(deletedFile.getAbsolutePath());
				
			if (deletedFile.exists()) {
				deletedFile.delete();
			}
			
	}

}
