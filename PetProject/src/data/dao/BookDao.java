package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.AccountDto;
import data.dto.BookDto;
import data.dto.UserDto;
import mysql.db.MysqlConnect;

public class BookDao {
	MysqlConnect db = new MysqlConnect();
	
	
	public List<HashMap<String, String>> getPuppyList(String id)
	{
		String sql ="select a.dog_num, a.acc_name, a.breed, a.age, a.gender, u.user_name, u.hp, u.user_num from account_tb a, user_tb u where a.user_num = u.user_num and u.id =?";
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			
			//실행
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("dog_num", rs.getString("dog_num"));
				map.put("acc_name", rs.getString("acc_name"));
				map.put("breed", rs.getString("breed"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("user_name", rs.getString("user_name"));
				map.put("hp", rs.getString("hp"));
				map.put("user_num", rs.getString("user_num"));
				//list에 추가
				list.add(map);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public void insertBook(BookDto dto)
	{
		String sql = "insert into book (petcenter,petselect,startday,endday,user_num,dog_num) values (?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPetcenter());
			pstmt.setString(2, dto.getPetselect());
			pstmt.setString(3, dto.getStartday());
			pstmt.setString(4, dto.getEndday());
			pstmt.setString(5, dto.getUser_num());
			pstmt.setString(6, dto.getDog_num());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	public List<HashMap<String, String>> getAllBook()
	{
		String sql = "select u.id, u.user_name, u.hp, a.acc_name, a.breed, a.age, a.gender, b.startday, b.endday, b.petcenter, b.petselect, b.book_num from user_tb u, account_tb a, book b where u.user_num = b.user_num and b.user_num = a.user_num and b.dog_num = a.dog_num order by book_num desc";
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getMyConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", rs.getString("id"));
				map.put("user_name", rs.getString("user_name"));
				map.put("hp", rs.getString("hp"));
				map.put("acc_name", rs.getString("acc_name"));
				map.put("breed", rs.getString("breed"));
				map.put("age", rs.getString("age"));
				map.put("gender", rs.getString("gender"));
				map.put("startday", rs.getString("startday"));
				map.put("endday", rs.getString("endday"));
				map.put("petcenter", rs.getString("petcenter"));
				map.put("petselect", rs.getString("petselect"));
				map.put("book_num", rs.getString("book_num"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally 
		{
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public List<HashMap<String, String>> getUserBook(String id)
	{
		String sql = "select u.id, u.user_name, u.hp, a.acc_name, b.startday, b.endday, b.petcenter, b.petselect, b.book_num from user_tb u, account_tb a, book b where u.user_num = b.user_num and b.user_num = a.user_num and b.dog_num = a.dog_num and u.id=? order by book_num desc";
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = db.getMyConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			//실행
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("user_name", rs.getString("user_name"));
				map.put("hp", rs.getString("hp"));
				map.put("acc_name", rs.getString("acc_name"));
				map.put("startday", rs.getString("startday"));
				map.put("endday", rs.getString("endday"));
				map.put("petcenter", rs.getString("petcenter"));
				map.put("petselect", rs.getString("petselect"));
				map.put("book_num", rs.getString("book_num"));
				
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally 
		{
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
	public void deleteBook(String num){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="delete from book where book_num=?";
		conn = db.getMyConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
}











