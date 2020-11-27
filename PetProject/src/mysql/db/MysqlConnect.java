package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlConnect {
	String driver="com.mysql.jdbc.Driver";
	String myurl="jdbc:mysql://semidb.cvlqexbehcqg.ap-northeast-2.rds.amazonaws.com:3306/semidbfinal?serverTimezone=Asia/Seoul";
	String myid="admin";
	String mypass="bit301301";
	
	public MysqlConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Mysql 드라이버 오류: "+e.getMessage());
		}
	}

	
	//본인 pc의 mysql 연결
	public Connection getMyConnection()
	{
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(myurl, myid, mypass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("내 컴의 mysql 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	
	
		
		public void dbClose(Connection conn,Statement stmt)
		{
			try {
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				
			}
		}
		
		public void dbClose(Connection conn,Statement stmt, ResultSet rs)
		{
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				
			}
		}
		
		public void dbClose(Connection conn,PreparedStatement pstmt)
		{
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				
			}
		}
		
		public void dbClose(Connection conn, PreparedStatement pstmt, ResultSet rs)
		{
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				
			}
		}
}