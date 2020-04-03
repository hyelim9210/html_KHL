package project.restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JOptionPane;

import com.util.DBConnectionMgr;

public class RestaurantDao {
	
	DBConnectionMgr		dbMgr	= DBConnectionMgr.getInstance();
	Connection			con		= null;
	PreparedStatement	pstmt	= null;
	//ref커서를 이용할 예정이라 resultSet은 우선 보류..
	ResultSet			rs		= null;
	
	
	public int resultINS(Map<String, Object> pMap) {//입력 결과로 1 또는 0을 반환
		int result = 0;
		
		StringBuilder sql = new StringBuilder();
		
		    sql.append("INSERT INTO restaurant(res_num, res_name, res_tel, res_addr");
		    sql.append("    , res_hate, res_like, res_photo                        ");
		    sql.append("    , res_info, res_time, lat, lng)                        ");
			sql.append("	VALUES(seq_restaurant_num.nextval, ?, ?, ?             ");
			sql.append("	, 0, 0, ? , ?, ?, ?, ?)                                ");
		
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			int cnt = 1;
			pstmt.setString(cnt++, pMap.get("res_name").toString());
			pstmt.setString(cnt++, pMap.get("res_tel").toString());
			pstmt.setString(cnt++, pMap.get("res_addr").toString());
			pstmt.setString(cnt++, pMap.get("res_photo").toString());
			pstmt.setString(cnt++, pMap.get("res_info").toString());
			pstmt.setString(cnt++, pMap.get("res_time").toString());
			pstmt.setDouble(cnt++, Double.parseDouble(pMap.get("lat").toString()));
			pstmt.setDouble(cnt++, Double.parseDouble(pMap.get("lng").toString()));
			result = pstmt.executeUpdate();
			System.out.println("result : " + result);
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
	
	public List<Map<String, Object>> restList(){
		List<Map<String, Object>> rList = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT res_num, res_name, res_tel, res_addr"); 
		sql.append(" , res_hate, res_like, res_photo, res_info");
		sql.append(" , res_time, lat, lng ");
		sql.append(" FROM restaurant");
		
		try {
			
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String, Object> rMap = null;
			rList = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				rMap = new HashMap<String, Object>();
				rMap.put("res_num", rs.getInt("res_num")); 
				rMap.put("res_name", rs.getString("res_name")); 
				rMap.put("res_tel", rs.getString("res_tel"));
				rMap.put("res_addr",  rs.getString("res_addr"));
				rMap.put("res_hate", rs.getInt("res_hate")); 
				rMap.put("res_like", rs.getInt("res_like")); 
				rMap.put("res_photo", rs.getString("res_photo"));
				rMap.put("res_info",  rs.getString("res_info"));
				rMap.put("res_time",  rs.getString("res_time"));
				rMap.put("lat", rs.getDouble("lat"));
				rMap.put("lng", rs.getDouble("lng"));
				rList.add(rMap);
			}
			
		} catch (SQLException se) {
			System.out.println("--------------- [[ restList - SQL ]] ---------------");
			se.printStackTrace();
			System.out.println("SQL : " + sql.toString());
		} catch (Exception e) {
			System.out.println("--------------- [[ restList ]] ---------------");
			e.printStackTrace();
		}
		
		return rList;
	}
	
	public List<Map<String, Object>> mapRestList(){
		List<Map<String, Object>> mrList = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT res_name, res_photo, lat, lng ");
		sql.append(" FROM restaurant");
		
		try {
			
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String, Object> mrMap = null;
			mrList = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				mrMap = new HashMap<String, Object>();
				mrMap.put("res_name", rs.getString("res_name")); 
				mrMap.put("res_photo", rs.getString("res_photo"));
				mrMap.put("lat", rs.getDouble("lat"));
				mrMap.put("lng", rs.getDouble("lng"));
				mrList.add(mrMap);
			}
			
		} catch (SQLException se) {
			System.out.println("--------------- [[ mapRestList - SQL ]] ---------------");
			se.printStackTrace();
			System.out.println("SQL : " + sql.toString());
		} catch (Exception e) {
			System.out.println("--------------- [[ mapRestList ]] ---------------");
			e.printStackTrace();
		}
		
		return mrList;
	}
	
	
}
