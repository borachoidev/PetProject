package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import data.dto.ReviewDto;
import mysql.db.MysqlConnect;

public class ReviewDao {
	MysqlConnect db=new MysqlConnect();
	
	//글추가
	public void insertSmart(ReviewDto dto) {
		Connection conn=null;
		PreparedStatement pstmt =null;
		String sql="insert into review (id,title,content,writeday) values (?,?,?,now())";
		
		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getTitle());
			pstmt.setString(3,dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//전체글 갯수
	public int getTotalCount() {
		int tot=0;
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		String sql="select count(*) count from review";
		
		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
			tot=rs.getInt("count");
			}
			
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tot;
	}
	
	
	//페이징 처리한 리스트 목록 반환
	public List<ReviewDto> getList(int start,int end){
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		String sql="select * from review order by review_num desc limit ?,?";
		Connection conn=null;
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		
		try
		{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDto dto=new ReviewDto();
				dto.setReview_num(rs.getString("review_num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getString("writeday"));
				
				list.add(dto);
				}
			
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;		
	}
	
	//데이터가져오기
	public ReviewDto getData(String num) {
		ReviewDto dto=new ReviewDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
				
		String sql="select * from review where review_num=?";
		
		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setReview_num(rs.getString("review_num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getString("writeday"));
			}
			
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.dbClose(conn, pstmt, rs);
		}
			
		return dto;
		
	}
	
	public int getMaxNum() {
		int max=0;
		String sql="select ifnull(max(review_num),0) max from review";
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs=null;

		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				max=rs.getInt(1);

		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}

		return max;
	}
	
	//수정
	public void updateReview(ReviewDto dto) {
		String sql="update review set title=?, content=? where review_num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);

			//바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2,	dto.getContent());
			pstmt.setString(3, dto.getReview_num());

			//실행
			pstmt.execute();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//삭제
	
	
	//최신 후기 8개 가져오기
	public List<ReviewDto> getBestReview(){
		//최신글5개 가져오기
		String sql="select * from review order by review_num asc limit 0,8";
		List<ReviewDto> list=new ArrayList<ReviewDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try
		{
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
			ReviewDto dto=new ReviewDto();
			dto.setReview_num(rs.getString("review_num"));
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setWriteday(rs.getString("writeday"));
			
			list.add(dto);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
				
		
		return list;
					
	}
	
	public void deleteReview(String num){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="delete from review where review_num=?";
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
		
}

