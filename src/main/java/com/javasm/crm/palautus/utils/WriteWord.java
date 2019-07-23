package com.javasm.crm.palautus.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;

import com.javasm.crm.palautus.entity.Returnindepot;
import com.javasm.crm.palautus.entity.Returnoutdepot;

import freemarker.template.Configuration;
import freemarker.template.Template;



public class WriteWord {

	
	public static String outwrite(Returnoutdepot r)  throws Exception{
		Configuration c = new Configuration();
		c.setDefaultEncoding("UTF-8");
		c.setDirectoryForTemplateLoading(new File("D:\\eclipse-workspace\\CRM\\src\\main\\java\\com\\javasm\\crm\\palautus\\utils"));
		//c.setClassForTemplateLoading(WriteWord.class, );
		String path = "D://o"+r.getOutdepotid()+".docx";
		Writer w = new FileWriter(path);
		Template t = c.getTemplate("outdepot.xml");
		t.process(r, w);
		w.close();
		return path;
	}
	
	
	public static String inwrite(Returnindepot r)  throws Exception{
		Configuration c = new Configuration();
		c.setDefaultEncoding("UTF-8");
		c.setDirectoryForTemplateLoading(new File("D:\\eclipse-workspace\\CRM\\src\\main\\java\\com\\javasm\\crm\\palautus\\utils"));
		//c.setClassForTemplateLoading(WriteWord.class, );
		String path = "D://i"+r.getIndepotid()+".docx";
		Writer w = new FileWriter(path);
		Template t = c.getTemplate("indepot.xml");
		t.process(r, w);
		w.close();
		return path;
	}
}
