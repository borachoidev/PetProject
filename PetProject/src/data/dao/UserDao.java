package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import data.dto.UserDto;
import data.dto.UserDto2;
import mysql.db.MysqlConnect;



public class UserDao {
	MysqlConnect db=new MysqlConnect();

	// 아이디가 있으면 true 반환 ,없으면 false반환

	public boolean isIdSearch(String id)
	{
		boolean find = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user_tb where id=?";
		conn = db.getMyConnection();
	

		try
		{
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				find = true;
			}

		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			db.dbClose(conn, pstmt, rs);
		}

		return find;
	}
	
	public void insertUser(UserDto2 dto)
	{
		String sql = " insert into user_tb (user_name,id,pass,road_addr,jibun_addr,zipcode,detail_addr,agree,email,hp) values (?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getMyConnection();
		try
		{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getRoad_addr());
			pstmt.setString(5, dto.getJibun_addr());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getDetail_addr());
			pstmt.setInt(8, dto.getAgree());

			String email = dto.getEmail1() + "@" + dto.getEmail2();
			pstmt.setString(9, email);
			String hp = dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3();
			pstmt.setString(10, hp);
			
			
			pstmt.execute();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally
		{
			db.dbClose(conn, pstmt);
		}

	}

}
