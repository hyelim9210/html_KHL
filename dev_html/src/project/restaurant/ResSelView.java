package project.restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.util.DBConnectionMgr;

public class ResSelView {

	DBConnectionMgr		dbMgr	= DBConnectionMgr.getInstance();
	Connection			con		= null;
	PreparedStatement	pstmt	= null;
	ResultSet			rs		= null;
	
	public int resultINS(Map<String, Object> pMap) {//입력 결과로 1 또는 0을 반환
		int result = 0;
		
		StringBuilder sql = new StringBuilder();
		
			sql.append("SELECT res_num, res_name, res_tel, res_addr\r\n"); 
			sql.append(" , res_hate, res_like, res_photo, res_info");
			sql.append(" , res_time, lat, lng ");
			sql.append(" FROM restaurant");
			
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			
			

		} catch (SQLException se) {
			System.out.println("--------------- [[ resultINS - SQL ]] ---------------");
			se.printStackTrace();
			System.out.println("SQL : " + sql.toString());
		} catch (Exception e) {
			System.out.println("--------------- [[ resultINS ]] ---------------");
			e.printStackTrace();
			
		}
		return result;
	}
	
	
}
