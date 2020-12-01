package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AdoptDto;
import mysql.db.MysqlConnect;

public class AdoptDao {
	MysqlConnect db=new MysqlConnect();
		
	//insert
	public void insertAdopt(AdoptDto dto)
	{
		String sql="insert into adopt (id,breed,age,gender,vaccine,content,photo,writeday) values (?,?,?,,?,?,?,?,now())";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getBreed());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getVaccine());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getPhoto());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}

	

	//전체 강아지 데이터 가져오기
	public List<AdoptDto> getAlldogs(int start,int end)
	{
	
		List<AdoptDto>list=new ArrayList<AdoptDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql ="select * from adopt order by adopt_num desc "
				+ "limit ?,?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				AdoptDto dto=new AdoptDto();
				dto.setTitle(rs.getString("content"));
				dto.setAdopt_num(rs.getString("adopt_num"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setVaccine(rs.getString("vaccine"));
				dto.setPhoto(rs.getString("photo"));
				dto.setId(rs.getString("id"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
						
	}
	
	//한개 데이타 가져오기
	public AdoptDto getData(String adopt_num)
	{
		AdoptDto dto=new AdoptDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from adopt where adopt_num=?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, adopt_num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setTitle(rs.getString("content"));
				dto.setAdopt_num(rs.getString("adopt_num"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setBreed(rs.getString("breed"));
				dto.setVaccine(rs.getString("vaccine"));
				dto.setPhoto(rs.getString("photo"));
				dto.setId(rs.getString("id"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;	
	}
	
	//삭제
	public void deleteAdopt(String adopt_num)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from adopt where adopt_num=?";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, adopt_num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	

	public int getTotalCount() {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from adopt";
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				n = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}

		return n;
	}
			
}