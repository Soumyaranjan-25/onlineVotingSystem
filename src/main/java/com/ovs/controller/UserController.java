package com.ovs.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ovs.model.User;
import com.ovs.service.ElectionService;
import com.ovs.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private ElectionService electionService;
	
	
	@RequestMapping("/userDetailsByUser")
	public String userDetailsByUser(Model model) {
		model.addAttribute("userList",userService.getUserByApproveStatus(1));
		return "userDetailsByUser";
	}
	
	@RequestMapping("/downloadExcel")
	public void downloadExcel(HttpServletResponse response) throws Exception {
		System.out.println("Coming");
		List<User> userList=userService.getUserByApproveStatus(1);
		
		Workbook workBook=new XSSFWorkbook();
		Sheet sh=workBook.createSheet("userList");
		
		String[] columnHeadings = {"User Id","User Name","Regd No","Course","Branch","D.O.B","Mobile No","Email","Gender","Remark","Student Id card"};
		
		Font headerFont=workBook.createFont();
		headerFont.setBold(true);
		headerFont.setFontHeightInPoints((short)12);
		headerFont.setColor(IndexedColors.BLACK.index);
		
		CellStyle headerStyle=workBook.createCellStyle();
		headerStyle.setFont(headerFont);
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
		
		Row HeaderRow=sh.createRow(0);
		
		for(int i=0;i<columnHeadings.length;i++) {
			Cell cell=HeaderRow.createCell(i);
			cell.setCellValue(columnHeadings[i]);
			cell.setCellStyle(headerStyle);
		}
		sh.createFreezePane(0, 1);
		
		CreationHelper creationHelper=workBook.getCreationHelper();
		CellStyle dateStyle=workBook.createCellStyle();
		dateStyle.setDataFormat(creationHelper.createDataFormat().getFormat("dd/MM/yyyy"));
		int rowNum=1;
		for(User i:userList) {
			Row row=sh.createRow(rowNum++);
			row.createCell(0).setCellValue(i.getUserId());
			row.createCell(1).setCellValue(i.getUserName());
			row.createCell(2).setCellValue(i.getRegdNo());
			row.createCell(3).setCellValue(i.getCourse().getCourseName());
			row.createCell(4).setCellValue(i.getBranch().getBranchName());
			Cell dateCell=row.createCell(5);
			dateCell.setCellStyle(dateStyle);
			dateCell.setCellValue(i.getDob());
			row.createCell(6).setCellValue(i.getMobileNo());
			row.createCell(7).setCellValue(i.getEmail());
			row.createCell(8).setCellValue(i.getGender());
			row.createCell(9).setCellValue(i.getRemark());
			row.createCell(10).setCellValue(i.getIdCard());

		}
		for(int i=0;i<columnHeadings.length;i++) {
			sh.autoSizeColumn(i);
		}
//		Sheet sh2=workBook.createSheet("Second sheet");
		FileOutputStream fileOut=new FileOutputStream("D:/my file/userList.xlsx");
//		ServletOutputStream fileOut=response.getOutputStream();
		workBook.write(fileOut);
//		fileOut.close();
		workBook.close();
		System.out.println("Completed");
		
		
	}
	
	
}
