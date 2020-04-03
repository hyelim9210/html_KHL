package com.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 DBConnectionMgr은 여러 업무에서 공통으로 사용하는 클래스이다. 사용한 자원(Connection, PreparedStatement, ResultSet)은
 반드시 반납을 해야한다. 동시 접속자 수가 많은 시스템에서 자원 사용은 곧 메모리와 직결되므로
 서버가 다운 되거나, 시스템 장애 발생의 원인이 된다.
 */
public class DBConnectionMgr {

	Connection 	con	= null; //클래스() 전역에서 사용 가능하도록 전역변수로 선언하기
	
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";

	
	
	//물리적으로 떨어져 있는 오라클 서버에 URL 정보 추가
	public static final String _URL = "jdbc:oracle:thin:@192.168.0.191:1521:orcl11";

	//계정이 있어야 서버에 접속 가능
	public static String _USER = "scott";//직원이 퇴사하면 바꿔야된다. 이처럼 바꿀 수 있어야 하기 때문에 final로 안 함
	public static String _PW = "tiger"
			+ "";//static 하면 공유하는 거 생각하기
	//static은 클래스 급이라고 할 수 있다. 클래스라 함은, 인스턴스화하고 사용하는 변수나 메소드 생각하기
	//
	
	//싱글톤 : 하나의 객체를 여러 명이 공유할 수 있다.
	private static DBConnectionMgr dbMgr = null;
	private DBConnectionMgr() {
		
	}
	public static DBConnectionMgr getInstance() {
		if(dbMgr == null) {
			dbMgr = new DBConnectionMgr();
		}
		return dbMgr;
	}
	
	public Connection getConnection(){// 물리적으로 떨어져있는 오라클 서버와 연결통로를 만든다.
//		System.out.println("getConnection 호출 성공");
		
		//오라클 회사 정보를 수집함
		try {//JDBCTest.java에서 드라이버명을 바꾸면 이 에러가 잡힌다.
			Class.forName(_DRIVER); //드라이버 클래스명이 잘못 됐을 수도 있기 때문에
			//그 경우ClassNotFoundException 에러가 일어난다. 
			con = DriverManager.getConnection(_URL, _USER, _PW);
		} catch (ClassNotFoundException ce) {
			System.out.println("드라이버 클래스 이름을 찾을 수 없어요.");
		} catch(Exception e) {
			System.out.println("예외가 발생했음. 정상적으로 처리가 안 됐어요.");
			System.out.println(e.toString());
			e.printStackTrace();
		};
		return con;
		//con을 반환하고 있는데 con을 생성한 부분이 없다. getConnection의 반환타입이 con이기 때문에 가능하다
		//이런 걸 구현해주는 애들은 역할이 따로 있는 것이다.
		//반드시 메소드나 구현체 클래스가 있어야 사용할 수 있다.
	}
	public void freeConnection(Connection con
							 , PreparedStatement pstmt
							 , ResultSet rs) {
		try {
			//사용자원의 생성 역순으로 반환
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.toString());
		}
	}
	
	public void freeConnection(Connection con
							 , PreparedStatement pstmt) {//select일 때는 사용 못 함
		try {
			//사용자원의 생성 역순으로 반환
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.toString());
		}
	}

	public void freeConnection(Connection con
							 , CallableStatement cstmt
							 , ResultSet rs) {
		try {
			//사용자원의 생성 역순으로 반환
			if(rs!=null) {
				rs.close();
			}
			if(cstmt!=null) {
				cstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.toString());
		}
	}
	
	public void freeConnection(Connection con
							 , CallableStatement cstmt) {//프로시저
		try {
			//사용자원의 생성 역순으로 반환
			if(cstmt!=null) {
				cstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}catch(Exception e) {
			System.out.println("Exception : " + e.toString());
		}
	}
	
	
}
