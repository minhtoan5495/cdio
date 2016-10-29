package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAOImpl;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAOImpl productDAO = new ProductDAOImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String product_id = request.getParameter("product_id");
		String command = request.getParameter("command");

		ArrayList<Long> listBuy = null;
		String url = "/cart.jsp";
		//System.out.println(command);
		try {
			listBuy = (ArrayList<Long>) session.getAttribute("cartID");
			long idBuy = 0;
			if (request.getParameter("cartID") != null) {
				idBuy = Long.parseLong(request.getParameter("cartID"));
			}
			Product product= new Product();
			if(product_id!= null){
			product = productDAO.getProduct(Integer
					.parseInt(product_id));
			}
			switch (command) {
			case "insertItem":
				if (listBuy == null) {
					listBuy = new ArrayList<Long>();
					session.setAttribute("cartID", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart(product, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "addItem":
				if (listBuy == null) {
					listBuy = new ArrayList<Long>();
					session.setAttribute("cartID", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart(product, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "subItem":
				if (listBuy == null) {
					listBuy = new ArrayList<Long>();
					session.setAttribute("cartID", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.removeToCart(product, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "removeItem":
				cart.removeCart(product);
				url = "/cart.jsp";
				break;
			case "cancelItem":
				session.removeAttribute("cart");
				session.setAttribute("cart", new Cart());
				listBuy.add(idBuy);
				url = "/index.jsp";
				break;
			default:
				url = "/index.jsp";
				break;
			}
			
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
