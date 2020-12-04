package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MapDto;
import mysql.db.MysqlConnect;

public class MapDao {
	MysqlConnect db = new MysqlConnect();
	
	// insert
	public void insertStar(MapDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into map (xpos, ypos, star, id) values(?,?,?,?)";
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getXpos());
			pstmt.setString(2, dto.getYpos());
			pstmt.setDouble(3, dto.getStar());
			pstmt.setString(4, dto.getId());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
	// 회원이 썼나 안썻나 카운트
	public int isWritten(String xPos, String yPos, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from map where xpos=? and ypos=? and id=?";
		int count = 0; 
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, xPos);
			pstmt.setString(2, yPos);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return count;
	}
	
	// group by로 장소에 대한 별점의 평균 구하기
	public double getStarGrade(String xPos, String yPos) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select round(avg(star), 1) as avr from map where xpos=? and ypos=? group by xpos and ypos";
		double grade = 0;
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, xPos);
			pstmt.setString(2, yPos);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				grade = rs.getDouble(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return grade;
	}
}
