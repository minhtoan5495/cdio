package controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietHoaDonDAOImpl;
import dao.HoaDonDAOImpl;
import model.Cart;
import model.ChiTietHoaDon;
import model.HoaDon;
import model.Product;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HoaDonDAOImpl hoaDonDAO = new HoaDonDAOImpl();
	private ChiTietHoaDonDAOImpl chiTietHoaDon = new ChiTietHoaDonDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String dia_chi = request.getParameter("dia_chi");
		String dien_thoai = request.getParameter("dien_thoai");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String ho_ten = request.getParameter("ho_ten");
		String ho_ten_err="";
		if(ho_ten.equals("")){
			ho_ten_err+="Bạn chưa nhập thông tin!";
		}
		
		if(ho_ten_err.length()>0){
			request.setAttribute("ho_ten_err", ho_ten_err);
			request.setAttribute("ho_ten", ho_ten);
		}
		String url = "/checkout.jsp";
		try {
			if(ho_ten_err.length()==0){
				HoaDon hd = new HoaDon(0, ho_ten, dia_chi, dien_thoai, new Date());
				hoaDonDAO.themHoaDon(hd);
				TreeMap<Product, Integer> list = cart.getListProduct();
				for(Entry<Product, Integer> entry : list.entrySet()){
					chiTietHoaDon.themChiTietHoaDon(new ChiTietHoaDon(0, hoaDonDAO.getMaHD(hd), entry.getKey().getProduct_id(), entry.getValue(), entry.getKey().getPrice()));
					url ="/index.jsp";				
				}
				session.removeAttribute("cart");
				session.setAttribute("cart", new Cart());
				
			}else{
				url ="/checkout.jsp";
			
			}						
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		}
	}
}
