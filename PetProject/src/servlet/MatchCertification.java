package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.dao.UserDao;

/**
 * Servlet implementation class MatchCertification
 */
@WebServlet("/MatchCertification")
public class MatchCertification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        String id =request.getParameter("id");
        String pass= request.getParameter("pass");
        if(!AuthenticationKey.equals(AuthenticationUser))
        {
            System.out.println("인증번호 일치하지 않음");
            response.sendRedirect("index.jsp?main=Login/searchFailed.jsp");
            return;
        }
        
        UserDao dao =new UserDao();
        dao.changePass(pass, id);
        response.sendRedirect("index.jsp?main=Login/loginForm.jsp");

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

