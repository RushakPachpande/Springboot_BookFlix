
package com.bookflix.util;

import org.springframework.web.multipart.MultipartFile;

public class ImageUtil {

	// Utility method to get the file extension
	public static String getFileExtension(MultipartFile image) {
		String originalFilename = image.getOriginalFilename();

		if (originalFilename != null && originalFilename.contains(".")) {
			return originalFilename.substring(originalFilename.lastIndexOf(".")); // Returns ".jpg", ".png", etc.
		}

		return ".jpg"; // Default if no extension is found
	}

}
