package com.javasm.crm.b2c.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.javasm.crm.b2c.entity.Order;

//读取Excel文件中的数据，然后导入到数据库中
public class ReadExcel {
     
     
 	 //数据库文件批量导出
       /*//传进来的四个参数，
                路径 、Excel表的首行，数据库返回的数据，Excel的表名
*
     */
     public static void write(String path,List<Map<String,String>> data,String sheetName) {
    	 
    	 File f = new File(path);
 		if(f.exists())f.delete();//判断是否存在相同的表格，存在的话先删除
 		
 		//初始化创建一个工作簿对象
 	  Workbook  wb = new HSSFWorkbook();
 	  
 	//在工作簿中创建sheet表
	Sheet sheet  = wb.createSheet(sheetName);
	
	//向首行中写入记录
	  //此数组为excel表格的表头
	String[] firstRow ={"订单id","订单编号","订单类型","订单动作","业务类型","支付方式","下单日期","订单状态","会员账号","会员账号","配送方式","商品清单"};
			
	//创建首行,并遍历数组，向首行添加数据
	 Row first =  sheet.createRow(0);
    for(int i=0;i<firstRow.length;i++) {
          Cell cell = first.createCell(i);//单元格对象
          cell.setCellValue	(firstRow[i]);
    }
    //遍历data，向sheet中添加行
    for(int x=0;x<data.size();x++){
    	Row row = sheet.createRow(x+1);//从1开始的
    	Map<String,String> rowMap = data.get(x);
    	//遍历行
    	for(int c=0;c<firstRow.length;c++) {
    		String key = firstRow[c];
    		String value = rowMap.get(key);
    		Cell cell = row.createCell(c);
    		cell.setCellValue(value);
    	}
    }
    //保存到磁盘
    OutputStream os = null;
    try {
		os = new FileOutputStream(path);
		wb.write(os);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		try {
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
    
     }
     
     
     //文件导入的方法
     
     public static List<Order> read( String path){
    	 List<Order> list = new ArrayList<>();
    	Workbook wb;
    	 File f = new File(path);
    	 try {
    		//得到excel文档对象
			 wb = WorkbookFactory.create(f);
			int sheetNums = wb.getNumberOfSheets();//得到工作表的格式
			
			//遍历工作表
			for(int i=0;i<sheetNums;i++) {
				Sheet sheet = wb.getSheetAt(i);//得到每个工作表
			
				//获取sheet中第一行行号
				int firstRowNum = sheet.getFirstRowNum();
				//获取sheet中最后一行行号
				int lastRowNum = sheet.getLastRowNum();

				//循环向对象中保存数据
				for(int j = firstRowNum+1;j<=lastRowNum;j++){
					  
					//得到每一行
					Row row = sheet.getRow(j);
					
					Order or = new Order();
					
					
					Cell orderId = row.getCell(2);//订单编号
					double ii = orderId.getNumericCellValue();
				    int i1 = (int)ii;
					or.setOrderid(i1);
					
				
					Cell orderType = row.getCell(3);//订单类型
					or.setOrdertype(orderType.getStringCellValue());
					
					Cell orderAction  = row.getCell(4);//订单动作
					or.setOrderaction(orderAction.getStringCellValue());
					
					Cell businessType  = row.getCell(5);//业务类型
					or.setBusinesstype(businessType.getStringCellValue());
					
					Cell payMode    = row.getCell(6);//支付方式
					or.setPaymode(payMode.getStringCellValue());
					
					//先判断是否是日期格式，是的话转化为string类型
					Cell orderDate   = row.getCell(7);//下单日期
					boolean isDate = DateUtil.isCellDateFormatted(orderDate);//判断是否是日期格式   
					if(isDate) {
						Date dateCelValue = orderDate.getDateCellValue();
						 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						  String value = df.format(dateCelValue);
						  or.setOrderdate(value);
					}
					
					
					Cell orderState   = row.getCell(8);//订单状态
					or.setOrderstate(orderState.getStringCellValue());
					
					Cell memberAccount = row.getCell(9);//会员账号
					  double dd = memberAccount.getNumericCellValue();
					  int dd1 = (int)dd;
					  or.setMemberaccount(dd1);
					  
					Cell productId     = row.getCell(10);//商品编号
					int pp =  (int)productId.getNumericCellValue(); 
					 or.setProductid(pp);
					
					Cell distributionWay     = row.getCell(11);//配送方式
					 or.setDistributionway(distributionWay.getStringCellValue());
					
					
					Cell commodityList   = row.getCell(12);//商品清单
					 or.setCommoditylist(commodityList.getStringCellValue());
					
					list.add(or);
				}
			 
			}
			
		} catch (EncryptedDocumentException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	 return list;
     }
     
     
     
}
