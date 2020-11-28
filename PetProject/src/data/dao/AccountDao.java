package data.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.MysqlConnect;

public class AccountDao {
	MysqlConnect db=new MysqlConnect();
	
	//default 강아지 찾기
	public String getDefault(String id) {
		String accName="";
		Connection conn=null;
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		String sql="select b.acc_name from user_tb a, account_tb b"
				+ " where a.user_num=b.user_num and a.id=? and sel_acc=1";
	
		conn = db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				accName=rs.getString(1);
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return accName;
	}
}
