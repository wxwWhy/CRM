package com.javasm.crm.goodsAndGifts.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;

public class DfsUtil {
	private static String confName = "properties/fastdfs.properties";
	private static TrackerClient tc=null;
	private  static String httpUrl = null;
	
	static {
		Properties p = new Properties();
		URL url = DfsUtil.class.getClassLoader().getResource(confName);
		InputStream is = DfsUtil.class.getClassLoader().getResourceAsStream(confName);
		
		String confPath = url.getPath();
		
		try {
			ClientGlobal.init(confPath);//读取配置文件
			tc = new TrackerClient();
			
			p.load(is);
			httpUrl = p.getProperty("http.urlpath");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String getHttpAbsPath(String path) {
		return httpUrl+"/"+path;
	}
	
	public static String upload(String uploadFilePath) {
		String savePath = null;
		TrackerServer ts = null;
		StorageClient1 sc = null;
		try {
			ts = tc.getConnection();//跟踪服务对象，与某台跟踪服务器建立连接
		} catch (IOException e1) {
			return savePath;
		}
		
		File f = new File(uploadFilePath);
		String fileName  =f.getName();
		String fileSize = String.valueOf(f.length());
		String uploadTime = String.valueOf(System.currentTimeMillis());
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
	
		try {
			sc = new StorageClient1(ts, null);//与某台存储服务器建立连接。第二个形参是StrorageServer对象，该对象在StorageClient1会被初始化。
			//一般在元数据列表中把文件基本信息存储起来。比如文件名，文件大小，上传时间
			NameValuePair[] metas = {new NameValuePair("fileName", fileName),new NameValuePair("fileSize", fileSize),new NameValuePair("uploadTime", uploadTime)};
			savePath = sc.upload_file1(uploadFilePath, ext,metas);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return savePath;
	}
	
	public static String upload1(byte[] bs,String fileName,String fileSize) {
		String savePath = null;
		TrackerServer ts = null;
		StorageClient1 sc = null;
		try {
			ts = tc.getConnection();//跟踪服务对象，与某台跟踪服务器建立连接
		} catch (IOException e1) {
			return savePath;
		}
		String uploadTime = String.valueOf(System.currentTimeMillis());
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		try {
			sc = new StorageClient1(ts, null);//与某台存储服务器建立连接。第二个形参是StrorageServer对象，该对象在StorageClient1会被初始化。
			//一般在元数据列表中把文件基本信息存储起来。比如文件名，文件大小，上传时间
			
			NameValuePair[] metas = {new NameValuePair("fileName", fileName),new NameValuePair("fileSize", fileSize),new NameValuePair("uploadTime", uploadTime)};
			
			savePath = sc.upload_file1(bs, ext, metas);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return savePath;
	}
	
	//根据存储路径得到文件的元数据
	public static Map<String,String> getMetaData(String path){
		Map<String,String> map= new HashMap<>();
		TrackerServer ts = null;
		StorageClient1 sc = null;
		try {
			ts = tc.getConnection();//跟踪服务对象，与某台跟踪服务器建立连接
		} catch (IOException e1) {
			return null;
		}
		
		try {
			sc = new StorageClient1(ts, null);//与某台存储服务器建立连接。第二个形参是StrorageServer对象，该对象在StorageClient1会被初始化。
			
			NameValuePair[] metas = sc.get_metadata1(path);
			for (NameValuePair nv : metas) {
				map.put(nv.getName(), nv.getValue());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	
	//传入存储路径，返回文件的字节数组
	public static byte[] download(String path) {
		byte[] bs = null;
		TrackerServer ts = null;
		StorageClient1 sc = null;
		try {
			ts = tc.getConnection();//跟踪服务对象，与某台跟踪服务器建立连接
		} catch (IOException e1) {
			return null;
		}
		
		try {
			sc = new StorageClient1(ts, null);//与某台存储服务器建立连接。第二个形参是StrorageServer对象，该对象在StorageClient1会被初始化。
			 bs = sc.download_file1(path);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return bs;
	}
	
	//删除文件
	public static boolean delete(String path) {
		boolean result = false;
		TrackerServer ts = null;
		StorageClient1 sc = null;
		try {
			ts = tc.getConnection();//跟踪服务对象，与某台跟踪服务器建立连接
		} catch (IOException e1) {
			return result;
		}
		
		try {
			sc = new StorageClient1(ts, null);//与某台存储服务器建立连接。第二个形参是StrorageServer对象，该对象在StorageClient1会被初始化。
			int r = sc.delete_file1(path);
			result = r==0?true:false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//下载的代码
	
	public static void main(String[] args) {
		
		String upload = upload("D:/修改密码.png");
		System.out.println(upload);
		String path = "group1/M00/00/07/wKgU_FxvbL6ANvUoAABBLAySliA593.png";
		//<img src="group1/M00/00/07/wKgU_FxvbL6ANvUoAABBLAySliA593.png">
//		Map<String, String> metaData = getMetaData(path);//得到文件元数据,可以得到文件的真实名称，大小，上传时间。
		
//		byte[] download = download(path);
		
//		boolean delete = delete(path);
//		System.out.println(delete);
	}
	
	

}
