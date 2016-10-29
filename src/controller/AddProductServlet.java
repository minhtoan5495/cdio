/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImpl;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.common.io.ByteStreams;

import model.Product;

/**
 *
 * @author PC
 */
@MultipartConfig(maxFileSize = 16177215)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  ProductDAOImpl productDAO = new ProductDAOImpl();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	public AddProductServlet() {
        super();
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        String sprice = request.getParameter("price");
        Double price =Double.parseDouble(sprice);
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String[] category_id_ar = request.getParameterValues("category_id");
        String tinh_trang = request.getParameter("tinh_trang");
        String description_err="";
        String scategory_id = getValueToArray(category_id_ar);
        int category_id= Integer.parseInt(scategory_id);
        if(description.equals("")){
        	description_err+="Bạn chưa nhập đầy đủ!";
		}		
		if(description_err.length()>0){
			request.setAttribute("description_err", description_err);
			request.setAttribute("description", description);
		}
		InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
                inputStream = filePart.getInputStream();
        }
        int lastId= productDAO.getLastId();
        String location = "D:\\Java\\Web\\Code\\cdio\\WebContent\\images\\detail\\"+name+String.valueOf(lastId+1)+".jpg" ;
        String image = name+String.valueOf(lastId+1)+".jpg";
        saveBytesToFile(location, getbyte(inputStream));
        productDAO.insertProduct(new Product(lastId,name,image,price,description,category_id,new Date(),Integer.parseInt(tinh_trang)));
        response.sendRedirect("quanliproduct.jsp");
    }
    private String getValueToArray(String[] array){
    	for(String s : array){
    		if(s!=null){
    			return s;
    		}
    	}
    	return null;
    }
    private void saveBytesToFile(String filePath, byte[] fileBytes) throws IOException {
        FileOutputStream outputStream = new FileOutputStream(filePath);
        outputStream.write(fileBytes);
        outputStream.close();
    }
    private byte[] getbyte(InputStream is) throws IOException {
    	byte[] targetArray = ByteStreams.toByteArray(is);
        return targetArray;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
