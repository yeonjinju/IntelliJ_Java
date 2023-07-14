package guest.dao;

import guest.dto.GuestDto;
import util.DbcpBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class GuestDao {
	
	private static GuestDao dao;
	//외부에서 객체 생성하지 못하게
	private GuestDao() {}
	//자신의 참조값을 리턴해주는 메소드 
	public static GuestDao getInstance() {
		if(dao==null) {
			dao=new GuestDao();
		}
		return dao;
	}
	//글하나의 정보를 수정 반영하는 메소드(비밀번호가 일치해야 수정이 된다)
	public boolean update(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_guest"
					+ " SET writer=?, content=?"
					+ " WHERE num=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글하나의 정보를 리턴하는 메소드
	public GuestDto getData(int num) {
		GuestDto dto=null;
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "SELECT num, writer, content, pwd, regdate"
					+ " FROM board_guest"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				dto=new GuestDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 이 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return dto;
	}
	
	//글 하나의 정보를 DB 에서 삭제하는 메소드
	public boolean delete(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_guest"
					+ " WHERE num=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글 하나의 정보를 DB 에 저장하는 메소드 
	public boolean insert(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					+ " (num, writer, content, pwd, regdate)"
					+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());
			//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//전체 글의 목록을 리턴해주는 메소드 
	public List<GuestDto> getList(){
		//글목록을 담을 객체를 미리 생성
		List<GuestDto> list=new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql = "SELECT num, writer, content, pwd, regdate"
					+ " FROM board_guest"
					+ " ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성

			//select 문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while (rs.next()) {
				GuestDto dto=new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate"));//날짜도 getString() 으로 읽어온다.
				//글정보가 담긴 dto 를 ArrayList 객체에 누적시킨다.
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 이 Connection Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return list;
	}
}








