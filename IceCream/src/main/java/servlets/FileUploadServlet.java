package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;


import connection.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        String product_name = request.getParameter("product_name");
        String supplier_Id = request.getParameter("supplier_Id");
        String product_description = request.getParameter("product_description");
        String product_category_Id = request.getParameter("product_category_Id");
        String product_stock = request.getParameter("product_stock");
        String price = request.getParameter("price");

        System.out.println(product_category_Id);
        Part part = request.getPart("product_image");//
        String fileName = extractFileName(part);//file name
        
        System.out.println(fileName);
        String final_fileName;
        int rs1 = 0;
        do {
        	Random rand = new Random();
            int maxnum = 9999999;
            int random_num =rand.nextInt(maxnum);
            
            final_fileName = random_num + fileName;
        	try {
	        	Connection con=DatabaseConnection.getConnection();
	        	PreparedStatement ps= con.prepareStatement("SELECT * FROM tbl_product where image_path like \"%"+final_fileName+"%\";");
				ResultSet rs=ps.executeQuery();
				
				if(rs.next()) {
					rs1=1;
				}
				else {
					rs1=0;
				}
			}catch(Exception e) {}

        }while(rs1==1);
        
        System.out.println("this is the final123: " +final_fileName);
        
        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        
        String applicationPath = "C:\\FOR CAPSTONE\\eclipse-workspace\\IceCream\\src\\main\\webapp\\";
        System.out.println("APPLICATION PATH: " +applicationPath);
        
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("UPLOAD PATH: " +uploadPath);
        
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        
        String savePath = uploadPath + File.separator + final_fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        
        String applicationPath1 = getServletContext().getRealPath("");
        String uploadPath1 = applicationPath1 + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath1);
        File fileUploadDirectory1 = new File(uploadPath1);
        if (!fileUploadDirectory1.exists()) {
            fileUploadDirectory1.mkdirs();
        }
        
        String savePath1 = uploadPath1 + File.separator + final_fileName;
        System.out.println("savePath: " + savePath1);
        String sRootPath1 = new File(savePath1).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath1);
        part.write(savePath1 + File.separator);
        File fileSaveDir2 = new File(savePath1);
        
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + final_fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ice_cream_store?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "0000");
            PreparedStatement pst = con.prepareStatement("insert into tbl_product(seller_Id, name, image_path, description, category_id, stock, price) values(?,?,?,?,?,?,?)");
            pst.setString(1, supplier_Id);
            pst.setString(2, product_name);
            pst.setString(3, dbFileName);
            pst.setString(4, product_description);
            pst.setString(5, product_category_Id);
            pst.setString(6, product_stock);
            pst.setString(7, price);
            pst.executeUpdate();
            out.println("<center><h1>Image inserted Succesfully......</h1></center>");
        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}