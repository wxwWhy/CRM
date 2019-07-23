/**  
    * @Package com.javasm.crm.b2c.utils  
    * @Description: TODO(用一句话描述该文件做什么)   
    */ 
package com.javasm.crm.b2c.utils;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
 
import freemarker.template.Configuration;
import freemarker.template.Template;


/**  
* @ClassName: WriteWordUtil2  
* @Description: TODO(导出word文件工具)  
* @author JAVASM  
* @date 2019年3月7日  
*    
*/
public  class WriteWordUtil2 {
	
	 
    private static Configuration configuration = null;
    private static Map<String,Template> allTemplate = null;

    static{
        configuration = new Configuration();
        configuration.setDefaultEncoding("UTF-8");
//        configuration.setClassForTemplateLoading(WriteWordUtil2.class, "D:\\eclipse-workspace\\javaeeWorkspace\\CRM\\src\\main\\java\\com\\javasm\\crm\\b2c\\utils");
        try {
			configuration.setDirectoryForTemplateLoading(new File("D:\\eclipse-workspace\\javaeeWorkspace\\CRM\\src\\main\\java\\com\\javasm\\crm\\b2c\\utils"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
        
        allTemplate = new HashMap<String,Template>();
        try{
	    //初始化的.ftl文档，下面createDoc方法要引用此处的key才能找到模版
            allTemplate.put("test", configuration.getTemplate("orderDetail.ftl"));
        }catch(IOException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private WriteWordUtil2(){
    }

    public static File createDoc(Map<?,?> dataMap,String type){
        String name = "temp"+(int)(Math.random()*100000)+".doc";
        File f = new File(name);
	//“test”为上面初始化的key值
        Template t = allTemplate.get("test");
        try{
            //这个地方不能使用FileWriter因为需要指定编码类型否则声场的word文档会因为有无法识别的编码而无法打开
        	
            Writer w = new OutputStreamWriter(new FileOutputStream(f),"utf-8");
            t.process(dataMap,w);
            w.close();
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return f;
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	//
	public static  void write(Map<String,Object> map2,String templatePath) {
		
		String path = "D://orderDetail.doc";
		Writer out = null;
		try {
			out = new FileWriter(path);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		Configuration c = new Configuration();
		c.setDefaultEncoding("UTF-8");
		
		c.setClassForTemplateLoading(WriteWordUtil2.class, templatePath);//设置模板路径
		
		try {
			Template template = c.getTemplate("orderDetail.ftl","/");//获取指定名称的模板
			template.process(map2,out);//传入数据，生成文件
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
}
