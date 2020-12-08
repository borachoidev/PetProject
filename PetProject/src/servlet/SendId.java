package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.dao.UserDao;
import data.dto.UserDto;

/**
 * Servlet implementation class FindPass
 */
@WebServlet("/SendId")
public class SendId extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email1 = request.getParameter("email1");
		String email2= request.getParameter("email2");
		String email= email1+"@"+email2;	
		System.out.println(email);
		//먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		UserDao dao =new UserDao();
		String id =dao.findID(email);
		System.out.println(id);
		if(id==""){
			response.sendRedirect("index.jsp?main=Login/searchFailed.jsp");
			return;
		}

		//mail server 설정
		String host = "smtp.gmail.com";
		String user = "petandmeproject@gmail.com"; 
		String password = "bit301@@";

		//메일 받을 주소
		String to_email = email;

		//SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user,password);
			}
		});
		// email 전송
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user,"펫앤미"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			//메일 제목
			msg.setSubject("펫앤미 | 아이디찾기");
			//메일 내용
			msg.setText("회원님의 아이디는 ["+ id +"] 입니다");

			Transport.send(msg);
			System.out.println("이메일 전송");

		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		response.sendRedirect("index.jsp?main=Login/sendEmail.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
