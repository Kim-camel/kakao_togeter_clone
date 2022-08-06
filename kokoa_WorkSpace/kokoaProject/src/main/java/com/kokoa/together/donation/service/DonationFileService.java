package com.kokoa.together.donation.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface DonationFileService {
	public String IMAGE_REPO = "c:/spring/image_repo";
	public String getMessage(String msg,String url);
	public String saveFile(MultipartFile file);
	public String saveFiles(List<MultipartFile> files);
	public void deleteImage(String fileName);
}
