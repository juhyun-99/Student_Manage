package model;

import java.sql.*;
import java.util.ArrayList;


public class StudentDAO {
	 private Connection conn = null;
	 private Statement stmt = null;
	 private PreparedStatement pstmt = null;
	 private ResultSet rs = null;
	 private String sql = null;
	   
	 public StudentDAO() {
		 String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	      String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
	      String user = "scott";
	      String pwd = "tiger";
	      
	      try { 
	         Class.forName(jdbc_driver);
	         conn = DriverManager.getConnection(jdbc_url, user, pwd); 
	      }
	      catch (Exception e) {
	         e.printStackTrace();
	      }
	 }
	 
	 
	 public ArrayList<StudentDO> getAllStudent(){ //2. 학생 정보 조회 - 전체조회
		 ArrayList<StudentDO> list = new ArrayList<StudentDO>();
		 StudentDO sDO = null;
		 
		 sql = "select * from student order by num";
		 try {
	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql);
	      
	         while (rs.next()) {
	        	 sDO = new StudentDO();
	        	 sDO.setNum(rs.getInt("num"));
	        	 sDO.setName(rs.getString("name"));
	        	 sDO.setGender(rs.getString("gender"));
	        	 sDO.setKorScore(rs.getInt("korscore"));
	        	 sDO.setEngScore(rs.getInt("engscore"));
	        	 sDO.setMathScore(rs.getInt("mathscore"));
	        	 sDO.setSciScore(rs.getInt("sciscore"));
	        	 list.add(sDO);
	        	 
	         }
	      }
	      catch(Exception e) {
	         e.printStackTrace();
	      }
	      finally {
	         try {
	            if(!stmt.isClosed()) {
	               stmt.close();
	            }
	         }
	         catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		 return list;
	 }
	 
	 public StudentDO getSelectStudent(int num){  //2. 학생 정보 조회 - 학번을 이용한 개별 조회
		 StudentDO sDO = null;
		 sql = "select * from student where num = ?";
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sDO = new StudentDO();
				sDO.setNum(rs.getInt("num"));
	        	sDO.setName(rs.getString("name"));
	        	sDO.setGender(rs.getString("gender"));
	        	sDO.setKorScore(rs.getInt("korscore"));
	        	sDO.setEngScore(rs.getInt("engscore"));
	        	sDO.setMathScore(rs.getInt("mathscore"));
	        	sDO.setSciScore(rs.getInt("sciscore"));
			}
		 }catch(Exception e) {
	         e.printStackTrace();
	      }
	      finally {
	         try {
	            if(!pstmt.isClosed()) {
	               pstmt.close();
	            }
	         }
	         catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		 return sDO;
	 }
	 
	 public int insertStudent(StudentDO sDO) { //학생 정보 입력
		 int rowCount = 0;
		 sql = "insert into student values (?, ?, ?, ?, ?, ?, ?)";
		 try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, sDO.getNum());
		        pstmt.setString(2, sDO.getName());
		        pstmt.setString(3, sDO.getGender());
		        pstmt.setInt(4, sDO.getKorScore());
		        pstmt.setInt(5, sDO.getEngScore());
		        pstmt.setInt(6, sDO.getMathScore());
		        pstmt.setInt(7, sDO.getSciScore());
		        rowCount = pstmt.executeUpdate();
		      }
		      catch(Exception e) {
		         e.printStackTrace();
		      }
		      finally {
		         try {
		            if(!pstmt.isClosed()) {
		               pstmt.close();
		            }
		         }
		         catch (Exception e) {
		            e.printStackTrace();
		         }
		      }
		 return rowCount;
	 }
	 
	 public int updateStudent(int kor, int eng, int math, int sci, int num) { //3. 성적 변경
		 int rowCount = 0;
		 sql = "update student set korscore = ? , engscore = ?, mathscore = ?, sciscore = ?"
		 		+ "where num = ?";
		 try {
				 pstmt = this.conn.prepareStatement(sql);
				 pstmt.setInt(1, kor);
				 pstmt.setInt(2, eng);
				 pstmt.setInt(3, math);
				 pstmt.setInt(4, sci);
				 pstmt.setInt(5, num);
				 rowCount = pstmt.executeUpdate();
		 }catch(Exception e) {
	         e.printStackTrace();
	      }
	      finally {
	         try {
	            if(!pstmt.isClosed()) {
	               pstmt.close();
	            }
	         }
	         catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		 return rowCount;
	 }
	 
	 public int deleteStudent(int num) { // 4.학생 정보 삭제
		 int rowCount = 0;
		 sql = "delete from student where num = ?";
		 
		 try {
			 pstmt = this.conn.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rowCount = pstmt.executeUpdate();
		 }
		 catch(Exception e) {
	         e.printStackTrace();
	      }
	      finally {
	         try {
	            if(!pstmt.isClosed()) {
	               pstmt.close();
	            }
	         }
	         catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
		 return rowCount;
	 }
	 
	 
	 public void closeConnection() {
	      try {
	         if(!conn.isClosed()) {
	            conn.close();
	         }
	      }
	      catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
}
