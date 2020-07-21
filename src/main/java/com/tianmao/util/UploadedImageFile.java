package com.tianmao.util;

import org.springframework.web.multipart.MultipartFile;

//图片上传
public class UploadedImageFile {
    MultipartFile image;
 
    public MultipartFile getImage() {
        return image;
    }
 
    public void setImage(MultipartFile image) {
        this.image = image;
    }
 
}

