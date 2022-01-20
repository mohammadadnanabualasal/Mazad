package com.example.mazad.controllers;

import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.UsersEntity;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.util.Map;

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

    public static void copyInputStreamToFile(InputStream inputStream, File file)
            throws IOException {
        try (FileOutputStream outputStream = new FileOutputStream(file, false)) {
            int read;
            byte[] bytes = new byte[8192];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        }

    }
    @PostMapping(value = "/action/newPrice")
    public ModelAndView postNewPrice(HttpServletRequest request, HttpSession session)
    {
        if(session.getAttribute("user") == null)
        {
            return new ModelAndView("redirect:/login");
        }
        Map<String, String[]> parameterMap = request.getParameterMap();
        double newPrice = Double.parseDouble(parameterMap.get("newPrice")[0]);
        String adId =parameterMap.get("adId")[0];
        AdsEntity ad = AdsEntity.getEntityById(adId);
        //ad.setLastPrice(newPrice);
        //ad.setLastBuyerUserId(((UsersEntity)session.getAttribute("user")).getId());
       // AdsEntity.updateAd(ad, adId);
        return new ModelAndView("redirect:"+parameterMap.get("redirectUrl")[0]);
    }
}
