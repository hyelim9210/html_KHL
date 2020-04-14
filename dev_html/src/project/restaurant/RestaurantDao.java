package project.restaurant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.swing.JOptionPane;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class RestaurantDao {
	
	DBConnectionMgr		dbMgr	= DBConnectionMgr.getInstance();
	Connection			con		= null;
	PreparedStatement	pstmt	= null;
	//ref커서를 이용할 예정이라 resultSet은 우선 보류..
	ResultSet			rs		= null;
	
	CallableStatement cstmt = null; //기본적으로는 얘가 필요한 것이다.
	OracleCallableStatement ocstmt = null; //얘도 필요하다.
	
	public static void main(String[] args) {
		RestaurantDao rDao = new RestaurantDao();
		String msg = rDao.proc_login("apple", "123");
		System.out.println("msg : " + msg);
		
	}
	
	public String proc_login(String u_id, String u_pw) {
		String msg = null;
		StringBuilder sql = new StringBuilder();
		sql.append("{ call proc_login2020(?, ?, ?)}");
		
		try {
			
			con = dbMgr.getConnection();
			cstmt = con.prepareCall(sql.toString());
			cstmt.setString(1, u_id);
			cstmt.setString(2, u_pw);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
			//오라클에서 제공하는 타입을 써도 되고, 자바에서 제공하는 VARCHAR 타입(JDBCType.VARCHAR)을 써도 된다. //out 속성일 때만 이렇게 하고 in일 땐 SetString 하면 된다.
//			cstmt.execute();//이렇게 하면 반환타입이 불리언이 된다.
			cstmt.executeUpdate();//이렇게 하면 반환타입이 int이다. 둘 중에 하나 사용하면 된다.
			msg = cstmt.getString(3);
			
		} catch (Exception e) {
			e.printStackTrace();
			e.toString();
		}
		return msg;
	}
	
	public List<Map<String, Object>> procRestList(){
		List<Map<String, Object>> rList = null;
		StringBuilder sql = new StringBuilder();
		
		try {
			//오라클사가 배포하는 드라이버 클래스를 스캔한다.
			con = dbMgr.getConnection();
			//물리적으로 떨어져있는 서버와의 연결통로 확보
			
			cstmt = con.prepareCall("{call proc_restaurant(?)}");
			//여기 맨 뒤에 절대 세미콜론이 들어가면 안 된다.
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			//프로시저의 아웃 속성을 지정해준다.
			//이제 resultSet으로 가기 전에 처리를 해달라고 해야한다.
			cstmt.execute();
			//sys_ref커서는 getCusor..?를 지원하지 않기 때문에 커서자체를 형변환 시켜준다.
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			//out속성이 하나니까 첫 번째 것을 꺼낸다..?
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
			System.out.println("--------------- [[ procRestList - SQL ]] ---------------");
			se.printStackTrace();
			System.out.println("SQL : " + sql.toString());
		} catch (Exception e) {
			System.out.println("--------------- [[ procRestList ]] ---------------");
			e.printStackTrace();
		}
		for(Map<String, Object> m : rList) {
			Set<String> keys = m.keySet();
			for(String key : keys) {
				System.out.println("key : " + key + ", value : " + m.get(key));
			}
		}
		return rList;
	}
	
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
