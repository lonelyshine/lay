package com.cy.ssm.tools;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.filechooser.FileSystemView;

public class FileTool {
       
	/** 
     * 改变图片的尺寸
     *  
     * @param source 
     *            源文件 
     * @param targetW 
     *            目标长 
     * @param targetH 
     *            目标宽 
     */  
    public static BufferedImage resize(BufferedImage source, int targetW, int targetH) throws IOException  
    {  
        int type = source.getType();  
        BufferedImage target = null;  
        double sx = (double) targetW / source.getWidth();  
        double sy = (double) targetH / source.getHeight();  
        // 这里想实现在targetW，targetH范围内实现等比缩放。如果不需要等比缩放  
        // 则将下面的if else语句注释即可  
       /* if (sx > sy)  
        {  
            sx = sy;  
            targetW = (int) (sx * source.getWidth());  
        }  
        else  
        {  
            sy = sx;  
            targetH = (int) (sy * source.getHeight());  
        }  */
        if (type == BufferedImage.TYPE_CUSTOM)  
        { // handmade  
            ColorModel cm = source.getColorModel();  
            WritableRaster raster = cm.createCompatibleWritableRaster(targetW,  
                    targetH);  
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();  
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);  
        }  
        else{  
            //固定宽高，宽高一定要比原图片大  
            target = new BufferedImage(targetW, targetH, type);  
            //target = new BufferedImage(200, 200, type);  
            }  
          
        Graphics2D g = target.createGraphics();  
          
        //写入背景  
       // g.drawImage(ImageIO.read(new File("D:\\Users\\qinxg\\Desktop\\201751916226149.JPG")), 0, 0, null);  
          
        // smoother than exlax:  
        g.setRenderingHint(RenderingHints.KEY_RENDERING,  
                RenderingHints.VALUE_RENDER_QUALITY);  
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));  
        g.dispose();  
        return target;  
    }  
  
  
    public static void main(String[] args) throws IOException  
    {  
    	FileTool iu = new FileTool();  
  
        BufferedImage image = ImageIO.read(new File("D:\\Users\\qinxg\\Desktop\\201751916226149.JPG"));  
        image = iu.resize(image, 200, 200);  
  
        ImageIO.write(image, "png", new FileOutputStream("D:\\Users\\qinxg\\Desktop\\test.JPG"));  
    }  
}
