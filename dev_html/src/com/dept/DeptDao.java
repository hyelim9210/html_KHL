package com.dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class DeptDao {
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Map<String, Object>> dlist = null;
	List<DeptVO> dvlist = null;
	
	public List<Map<String, Object>> deptList(){
		StringBuilder sql = new StringBuilder();
		dlist = new ArrayList<Map<String,Object>>();
		try {
			sql.append("SELECT deptno, dname, loc FROM dept");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			Map<String, Object> rMap = null;
			while(rs.next()){
				rMap = new HashMap<String, Object>();
				rMap.put("deptno", rs.getInt("deptno"));
				rMap.put("dname", rs.getString("dname"));
				rMap.put("loc", rs.getString("loc"));
				dlist.add(rMap);
			}
					
		} catch (Exception e) {
			System.out.println("쿼리문 오류");
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return dlist;
	}
	
	
	public List<DeptVO> deptvList(){
		StringBuilder sql = new StringBuilder();
		try {
			sql.append("SELECT deptno, dname, loc FROM dept");
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			dvlist = new ArrayList<DeptVO>();
			DeptVO dVO = null;
			while(rs.next()){
				dVO = new DeptVO();
				dVO.setDeptno(rs.getInt("deptno"));
				dVO.setDname(rs.getString("dname"));
				dVO.setLoc(rs.getString("loc"));
				dvlist.add(dVO);
			}
			System.out.println(dvlist.size());
		} catch (Exception e) {
			System.out.println("쿼리문 오류");
			e.printStackTrace();
		} finally {
			dbMgr.freeConnection(con, pstmt, rs);
		}
		return dvlist;
	}
	
		
	
}
