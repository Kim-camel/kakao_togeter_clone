package com.kokoa.together.donation.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.donation.service.DonationFileService;
import com.kokoa.together.donation.service.DonationService;

@Controller
@RequestMapping("/donation")
public class DonationController {
	@Autowired DonationService ds;
	
	@PostMapping("doFormRegister")
	public void doRegister(MultipartHttpServletRequest mul,HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="pdNo", required = false, defaultValue = "0") int pdNo) throws Exception{
		System.out.println(pdNo);
		String message = ds.doFormSave(mul, request, pdNo);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
		
	}
	@GetMapping("download")
	public void download(@RequestParam String file, HttpServletResponse response) throws Exception {
		
		response.addHeader("Content-disposition", "attachment; fileName="+file);
		File f = new File(DonationFileService.IMAGE_REPO+file);
		FileInputStream in = new FileInputStream(f);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	@GetMapping("now")
	public String now() {
		return "donation/now";
	}
	
	@GetMapping("epilogue")
	public String epilogue() {
		return "donation/epilogue";
	}
	
	@GetMapping(value = "nowList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<DonationDTO> nowList(@RequestParam("sort") int sort, @RequestParam("topic") int topic) throws Exception{
		System.out.println(sort);
		System.out.println(topic);
		return ds.nowList(sort, topic);
	}
	
	@RequestMapping(value = "fund/{dNo}", method = RequestMethod.GET)
	public String fund(@PathVariable("dNo") int dNo,Model model ) {
			ds.selForm(model, dNo);
		return "donation/fund";
	}
	@GetMapping("propose")
	public String propose() {
		return "donation/propose";
	}
	
	@ResponseBody
	@RequestMapping(value = "fileupload")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = DonationFileService.IMAGE_REPO; //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = "/image/"+fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}

			
		}
		
	}
	}
}
