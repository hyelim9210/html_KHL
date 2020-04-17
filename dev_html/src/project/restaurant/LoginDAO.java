package project.restaurant;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class LoginDAO {

	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
	CallableStatement cstmt = null;
	OracleCallableStatement ocstmt = null;
	ResultSet rs = null;
		public void proc_login2020(String u_id, String u_pw) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("{ call proc_login2020(?, ?, ?)}");
		
		try {
			
			con = dbMgr.getConnection();
			cstmt = con.prepareCall(sql.toString());
			cstmt.setString(1, u_id);
			cstmt.setString(2, u_pw);
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
			cstmt.execute();
			ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(3);
			while(rs.next()) {
				System.out.println(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			e.toString();
		}
		
	}
	public static void main(String[] args) {
		LoginDAO lDao = new LoginDAO();
		lDao.proc_login2020("test", "123");
	}
	
}
