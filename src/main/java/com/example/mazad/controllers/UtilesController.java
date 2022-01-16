package com.example.mazad.controllers;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

@Controller
public class UtilesController {

    @ResponseBody
    @GetMapping(value = "/image/{adType}/{adId}/{imageName}", produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] getImageWithMediaType(HttpServletResponse response, @PathVariable("adType") String adType, @PathVariable("adId") String adId, @PathVariable("imageName") String imageName) throws IOException {
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        String imagePath = System.getProperty("user.home") + "/MazadImages/" + adType + "/" + adId + "/" + imageName;
        byte[] bytes = getImageBytes(imagePath,imageName.substring(imageName.lastIndexOf('.') + 1));
        return bytes;
    }

    public byte[] getImageBytes( String path, String format) throws IOException{
        BufferedImage bImage = ImageIO.read(new File(path));
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ImageIO.write(bImage, format, bos);
        byte[] data = bos.toByteArray();
        return data;
    }

    @ResponseBody
    @RequestMapping(value = "/profileImage/{id}", produces = MediaType.IMAGE_JPEG_VALUE)
    public byte[] getProfileImage(HttpServletResponse response, @PathVariable("id") String id)
    {
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        File folder = new File(System.getProperty("user.home") + "/MazadImages/profileImages" );
        String path = System.getProperty("user.home")+"/MazadImages/profileImages/defaultProfile.jpg";
        String format ="jpg";
        File[] listOfFiles = folder.listFiles();
        for (File file:listOfFiles
             ) {
            if(id.equals(file.getName().substring(0, file.getName().lastIndexOf('.') )))
            {
                path = System.getProperty("user.home") + "/MazadImages/profileImages/"+file.getName();
                format = file.getName().substring(file.getName().lastIndexOf('.') + 1);
                break;
            }
        }
        File file = new File(path);
        byte[] bytes = null;
        try {
            bytes = getImageBytes(path,format);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bytes;
    }
}
