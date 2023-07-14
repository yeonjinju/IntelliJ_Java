package test.users.dao;

import test.users.dto.UsersDto;
import util.DbcpBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDao {
    private static UsersDao dao;
    //외부에서 객체 생성할 수 없도록
    private UsersDao(){}
    //참조값을 리턴해주는 static 메솓,
    public static UsersDao getInstance(){
        if (dao == null) {
            dao = new UsersDao();
        }
        return dao;
    }

    // 개인정보를 수정하는 메소드
    public boolean update(UsersDto dto){
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            String sql = "UPDATE users"
                    +" SET email=?, profile=?"
                    +" WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            // 실행할 sql 문이 미완성이라면 여기서 완성
            pstmt.setString(1, dto.getEmail());
            pstmt.setString(1, dto.getProfile());
            pstmt.setString(2, dto.getId());
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







    // 비밀번호를 수정하는 메소드
    public boolean updatePwd(UsersDto dto){
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            String sql = "UPDATE users"
                    + " SET PWD = ?"
                    + " WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getPwd());
            pstmt.setString(2, dto.getId());
            rowCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
            }
        } if (rowCount >0) {
            return true;
        } else {
            return false;
        }
    }

    //프로필 이미지 경로를 수정하는 메소드
    public boolean updateProfile(UsersDto dto){
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            String sql = "UPDATE users"
                    +" SET PROFILE = ?"
                    +" WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getProfile());
            pstmt.setString(2, dto.getId());
            rowCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
            }
        } if (rowCount > 0) {
            return true;
        } else {
            return false;
        }
    }

    //회원 한명의 정보를 리턴하는 메소드
    public UsersDto getData(String id) {
        UsersDto dto = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn();
            String sql = "SELECT pwd, email, profile, regdate"
                    + " FROM users"
                    + " WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                dto = new UsersDto();
                dto.setId(id);
                dto.setPwd(rs.getString("pwd"));
                dto.setEmail(rs.getString("email"));
                dto.setProfile(rs.getString("profile"));
                dto.setRegdate(rs.getString("regdate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
            }
        }
        return dto;
    }

    //인자로 전달되는 dto 에 있는 아이디와, 비밀번호를 이용해서 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
    public boolean isValid(UsersDto dto) {
        //아이디 비밀번호 유효성 여부를 담을 변수 만들고 초기값 false 부여하기
        boolean isValid=false;
        //필요한 객체를 담을 지역변수를 미리 만들어 둔다.
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            //Connection Pool 에서 Connection 객체를 하나 얻어온다.
            conn = new DbcpBean().getConn();
            //실행할 sql 문의 뼈대 구성하기
            String sql = "SELECT id FROM users WHERE id=? AND pwd=?";
            //sql 문의 ? 에 바인딩 할게 있으면 한다
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPwd());
            //SELECT 문을 수행하고 결과값을 받아온다.
            rs = pstmt.executeQuery();
            //SELECT 된 ROW 가 있는지 확인해 본다.
            if (rs.next()) {
                //SELECT 된 row 가 있다면 유효한 정보가 맞다.
                isValid=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close(); //Connection Pool 에 Connection 반납하기
            } catch (Exception e) {
            }
        }
        return isValid;
    }

    //회원 한 명의 정보를 DB에 저장하고 성공여부를 리턴하는 메소드
    public boolean insert(UsersDto dto){
        Connection conn = null;
        PreparedStatement pstmt=null;
        int rowCount = 0; //초기값을 0으로 부여
        //insert, update, delete 작업을 통해서 변화된(추가, 수정, 삭제) row의 개수를 담을 변수
        try {
            //Connection 객체의 참조값 얻어오기
            conn = new DbcpBean().getConn();
            //실행할 sql문
            String sql = "INSERT INTO users (id, pwd, email, regdate) VALUES (?, ?, ?, SYSDATE)";
            //sql문을 대신 실행해줄 PreparedStatement 객체의 참조값 얻어오기
            pstmt = conn.prepareStatement(sql);
            //sql 문이 ? 가 존재하는 미완성이라면 여기서 완성한다.
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPwd());
            pstmt.setString(3, dto.getEmail());
            //insert or update or delete 문을 실제 수행한다. 변화된 row의 개수가 리턴된다.
            rowCount = pstmt.executeUpdate(); //수행하고 리턴되는 값을 변수에 담는다.
            System.out.println("추가되었습니다.");
        } catch (Exception e){
            e.printStackTrace();
        } finally { //예외가 발생을 하던 안하던 실행이 보장되는 블럭에서 사용
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
        //변화된 row 의 개수가 0보다 크면 작업 성공
        return rowCount > 0;
    }
}
