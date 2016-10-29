package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAOImpl;
import model.User;
import tools.MD5;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String hoten = request.getParameter("ho_ten");
		String sdt = request.getParameter("sdt");
		String diachi = request.getParameter("dia_chi");
		String role = request.getParameter("role");

		String url = "/quanliuser.jsp";

		String username_err = "";

		if (username.equals("")) {
			username_err += "Vui lòng nhập !";
		} else {
			if (userDAO.checkUsername(username) == true) {
				username_err += "Email đã tồn tại !";
			}
		}
		if (username_err.length() > 0) {
			request.setAttribute("username_err", username_err);
		}
		
		try {
			if (username_err.length() == 0) {
				userDAO.insertUser(new User(0, hoten,sdt,diachi,Integer.parseInt(role), username, MD5.encrypt(password)));
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				url = "/quanliuser.jsp";
				
			} else {
				url = "/quanliuser.jsp";
			}
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/quanliuser.jsp");
		}
	}

}
