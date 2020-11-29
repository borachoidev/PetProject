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
	
	public int loginProcess(String id, String pass) {
		int ans=0;
		if(this.isIdSearch(id)) {
			//아이디가 존재하는 경우
			//비번이 맞는지 확인
			if(this.isIdPassCheck(id, pass)) {
				//맞는경우
				ans=3;
			}else {
				//틀린경우
				ans=2;
			}
			
		}else {
			//아이디가 존재하지 않는경우
			ans=1;
		}
		return  ans;
	}
	
	//아이디에 해당하는 비번이 맞으면 true ,틀리면 false
		public boolean isIdPassCheck(String id, String pass)
		{
			boolean find = false;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from user_tb where id=? and pass=?";

			conn = db.getMyConnection();
			try
			{
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, id);
				pstmt.setString(2, pass);
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
		
		public String getNum(String id)
		{
			
			String num="";
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select user_num from user_tb where id=?";
			conn=db.getMyConnection();
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next())
					num=rs.getString("user_num");
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt,rs);
			}
			return num;
		}
		
		public UserDto getData(String id) {
			UserDto dto = new UserDto();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from user_tb where id=?";
			conn = db.getMyConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto.setUser_num(rs.getString("user_num"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setEmail(rs.getString("email"));
					dto.setLvl(rs.getInt("lvl"));
					dto.setRoad_addr(rs.getString("road_addr"));
					dto.setDetail_addr(rs.getString("detail_addr"));
					dto.setHp(rs.getString("hp"));
					dto.setAgree(rs.getInt("agree"));
					dto.setZipcode(rs.getString("zipcode"));
					dto.setJibun_addr(rs.getString("jibun_addr"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(conn, pstmt, rs);
			}
			
			
			return dto;
		}
}
