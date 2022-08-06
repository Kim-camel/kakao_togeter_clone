package com.kokoa.together.donation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class DonationFileServiceImpl implements DonationFileService {
	public String getMessage(String msg, String url) {
		String message = null;
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + url + "';</script>";

		return message;
	}
	public String saveFile(MultipartFile file) {
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		String sysFileName = fo.format(new Date());
		sysFileName += file.getOriginalFilename();
		try {
			if(!new File(IMAGE_REPO).exists()){
                new File(IMAGE_REPO).mkdirs();
            }
			File saveFile= new File(IMAGE_REPO+"/"+sysFileName);
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}
	
	public String saveFiles(List<MultipartFile> files) {
		String filesName = "";
		SimpleDateFormat fo = new SimpleDateFormat("yyyyMMddHHmmss-");
		String sysFileName = fo.format(new Date());
		for (MultipartFile mf : files) 
			try {
				if(!new File(IMAGE_REPO).exists()){
	                new File(IMAGE_REPO).mkdirs();
	            }
				sysFileName = fo.format(new Date())+mf.getOriginalFilename();
				File saveFile= new File(IMAGE_REPO+"/"+sysFileName);
				mf.transferTo(saveFile);
				filesName += sysFileName+"--";
			} catch (Exception e) {
				e.printStackTrace();
			}
		return filesName;
	}
	public void deleteImage(String fileName) {
		
	}
	
}
