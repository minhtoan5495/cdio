package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAOImpl;
import model.Category;

/**
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryDAOImpl categoryDAO = new CategoryDAOImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
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
		String category = request.getParameter("category");
		String parent = request.getParameter("parent");		
		String parent_err="";
		if(parent.equals("")){
			parent_err+="Bạn chưa nhập thông tin!";
		}
		
		if(parent_err.length()>0){
			request.setAttribute("parent_err", parent_err);
			request.setAttribute("parent", parent);
		}
		String url ="/quanlicategory.jsp";
		try {
			if(parent_err.length()==0){
				categoryDAO.insertCategory(new Category(0,category, Integer.parseInt(parent)));
				//Category c = new Category(11,ten_loai, paren);
				//categoryDAO.insertCategory(c);
				url ="/quanlicategory.jsp";
			}else{
				url ="/quanlicategory.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/quanlicategory.jsp");
		}
	}

}
