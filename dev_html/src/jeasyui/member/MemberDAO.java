package jeasyui.member;

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

import com.util.DBConnectionMgr;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	ResultSet rs = null;
	//회원목록 조회 실습1 - SELECT문으로 처리
	public List<Map<String, Object>> memberList(){
		List<Map<String, Object>> mList = null;
		Map<String, Object> mMap = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT mem_no, mem_id, mem_pw, mem_name, ");
		sql.append(" zipcode, mem_addr, mem_email");
		sql.append(" FROM member_t");
		try {
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			mList = new ArrayList<Map<String,Object>>();
			while(rs.next()) {
				mMap = new HashMap<String, Object>();
				mMap.put("mem_no", rs.getInt("mem_no"));
				mMap.put("mem_id", rs.getString("mem_id"));
				mMap.put("mem_pw", rs.getString("mem_pw"));
				mMap.put("mem_name", rs.getString("mem_name"));
				mMap.put("zipcode", rs.getString("zipcode"));
				mMap.put("mem_addr", rs.getString("mem_addr"));
				mMap.put("mem_email", rs.getString("mem_email"));
				mList.add(mMap);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return mList;
	}
	
	//회원목록 조회 실습2 - 프로시저 사용해서 처리
	CallableStatement cstmt = null; //프로시저만 전담하는 애다.
	OracleCallableStatement ocstmt = null;	//REF 커서 조작 oracle.jdbc에 있는 것 임포트
	ResultSet prs = null;
	//프로시저 할 때는 cstmt, ocstmt, rs가 필요하다.
	public List<Map<String, Object>> procMemberList(){
		List<Map<String, Object>> mList = null;
		Map<String, Object> mMap = null;
		try {
			con = null;
			con = dbMgr.getConnection();
			//DBConnectionMgr에서 공통 코드를 작성했으므로 드라이버명, 계정 정보, orcl11[SID] 생략
			cstmt = con.prepareCall("{ call proc_memberList(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();//프로시저 처리해달라고 요청하는 메소드이다.
			ocstmt = (OracleCallableStatement)cstmt;
			//오라클에서만 제공되는 REF커서이므로 오라클에서 제공하는 인터페이스로 형전환 한다.
			prs = ocstmt.getCursor(1);
			mList = new ArrayList<Map<String,Object>>();
			while(prs.next()) {
				mMap = new HashMap<String, Object>();
				mMap.put("mem_no", prs.getInt("mem_no"));
				mMap.put("mem_id", prs.getString("mem_id"));
				mMap.put("mem_pw", prs.getString("mem_pw"));
				mMap.put("mem_name", prs.getString("mem_name"));
				mMap.put("zipcode", prs.getString("zipcode"));
				mMap.put("mem_addr", prs.getString("mem_addr"));
				mMap.put("mem_email", prs.getString("mem_email"));
				mList.add(mMap);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return mList;
	}
	
	public void printMemList(List<Map<String, Object>> mlist) {
		for(Map<String, Object> mMap : mlist) {
			Set<String> keys = mMap.keySet();
			for(String key : keys) {
				System.out.println("key : " + key + ", value : " + mMap.get(key));
			}
			System.out.println("---------------------");
		}
	}
	
	
	
	public static void main(String[] args) {
		MemberDAO mDao = new MemberDAO();
		List<Map<String, Object>> mList = null;
		mList = mDao.procMemberList();
		if(mList != null) {  
			System.out.println("mList.size() ==> " + mList.size());
			mDao.printMemList(mList);
		}
	}

}
