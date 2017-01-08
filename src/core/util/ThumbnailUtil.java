package core.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.MemoryCacheImageOutputStream;

import org.xhtmlrenderer.util.ImageUtil;

public class ThumbnailUtil {

	public static byte[] resize(byte[] byteArrayImg, int width, int height, boolean keepRatio) throws IOException {
		BufferedImage orgImage = ImageIO.read(new ByteArrayInputStream(byteArrayImg));
		if (keepRatio) {
			float widthRatio = (float)width / (float)orgImage.getWidth() ;
			float heightRatio = (float)height / (float)orgImage.getHeight();
			float ratio = Math.min(widthRatio, heightRatio);
			width = (int) (orgImage.getWidth() * ratio);
			height = (int) (orgImage.getHeight() * ratio);
		}
		
		BufferedImage imageBuff = ImageUtil.getScaledInstance(orgImage, width, height);
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		ImageIO.write(imageBuff, "jpg", buffer);
		return buffer.toByteArray();
	}
	
	public static byte[] resize(byte[] byteArrayImg, int width, int height, boolean keepRatio, float CompressionQuality) throws IOException {
		BufferedImage orgImage = ImageIO.read(new ByteArrayInputStream(byteArrayImg));
		if (keepRatio) {
			float widthRatio = (float)width / (float)orgImage.getWidth() ;
			float heightRatio = (float)height / (float)orgImage.getHeight();
			float ratio = Math.min(widthRatio, heightRatio);
			width = (int) (orgImage.getWidth() * ratio);
			height = (int) (orgImage.getHeight() * ratio);
		}
		
		BufferedImage imageBuff = ImageUtil.getScaledInstance(orgImage, width, height);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		ImageWriter jpgWriter = ImageIO.getImageWritersByFormatName("jpg").next();
		ImageWriteParam jpgWriteParam = jpgWriter.getDefaultWriteParam();
		jpgWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
		jpgWriteParam.setCompressionQuality(CompressionQuality);
		jpgWriter.setOutput(new MemoryCacheImageOutputStream(baos));
		jpgWriter.write(null, new IIOImage(imageBuff, null, null), jpgWriteParam);
		
		return baos.toByteArray();
	}
}
