package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.MD5;
import model.User;
import dao.UserDAOImpl;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String ho_ten = request.getParameter("ho_ten");
		String sdt = request.getParameter("sdt");
		String dia_chi = request.getParameter("dia_chi");

		String url = "/login.jsp";

		String username_err = "", password_err = "";

		if (username.equals("")) {
			username_err += "Vui lòng nhập đầy đủ !";
		} else {
			if (userDAO.checkUsername(username) == true) {
				username_err += "Email đã tồn tại !";
			}
		}
		if (password.length() < 5) {
			password_err += "Mật khẩu quá ngắn (>5) !";
		}
		if (username_err.length() > 0) {
			request.setAttribute("username_err", username_err);
			request.setAttribute("username", username);
		}
		if (password_err.length() > 0) {
			request.setAttribute("password_err", password_err);
		}
		try {
			if (username_err.length() == 0) {
				userDAO.insertUser(new User(0, ho_ten,sdt,dia_chi,2, username, MD5.encrypt(password)));
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				url = "/login.jsp";
				
			} else {
				url = "/login.jsp";
			}
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
