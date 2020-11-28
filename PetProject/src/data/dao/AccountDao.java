package data.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.AccountDto;
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
	
	public void deleteAcc(String dog_num)
	{
		String sql="delete from account_tb where dog_num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dog_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}


public void insertAcc(AccountDto dto)
	{
		String sql="insert into account_tb (acc_name,breed,weight,age,gender,photo,memo,user_num,sel_acc) values (?,?,?,?,?,?,?,?))";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setString(1, dto.getAcc_name());
			pstmt.setString(2, dto.getBreed());
			pstmt.setString(3, dto.getWeight());
			pstmt.setString(4, dto.getAge());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getMemo());
			pstmt.setString(7, dto.getUser_num());
			pstmt.setInt(8, dto.getSel_acc());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}


	public void updateAcc(AccountDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
	
		String sql="update account_tb set weight=?, age=?, gender=?, photo=?,"
				+ "memo=? sel_acc=?, where dog_num=?";
		//conn=db.getMyConnection();
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  dto.getWeight());
			pstmt.setString(2, dto.getAge());
			pstmt.setString(3, dto.getGender());
			
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getMemo());
			pstmt.setInt(6, dto.getSel_acc());
			pstmt.setString(7, dto.getDog_num());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
}
