package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HoaDonDAOImpl;

/**
 * Servlet implementation class DeleteHoaDon
 */
@WebServlet("/DeleteHoaDon")
public class DeleteHoaDonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHoaDonServlet() {
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
		HoaDonDAOImpl hoaDonDAOImpl = new HoaDonDAOImpl();
        String ma_hoa_don = request.getParameter("ma_hoa_don");
        String url = "/quanlihoadon.jsp";
		try {
			hoaDonDAOImpl.deleteHoaDon(Integer.parseInt(ma_hoa_don));
			url ="/quanlihoadon.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/quanlihoadon.jsp");
		}
	}

}
