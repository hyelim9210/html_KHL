package orm.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.vo.EmpVO;

public class SqlMapEmpDao {

	SqlSessionFactory sqlMapper = null;
	Logger logger = Logger.getLogger(SqlMapEmpDao.class);
	String resource = "orm/mybatis/Configuration.xml";
	
	public int empINS(Map<String, Object> pMap){
		int result =0;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession 객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("empINS", pMap);
			sqlSes.commit();
			System.out.println("result : " + result);
			logger.info("result : " + result);
		} catch (Exception e) {
			System.out.println("====================================================");
			e.printStackTrace();
			System.out.println("====================================================");
		}
		return result;
	}
	public List<Map<String, Object>> empList(Map<String, Object> pMap){
		logger.info("empList 호출 성공");
		List<Map<String, Object>> elist = null;
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession 객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			elist = sqlSes.selectList("empList", pMap);
			System.out.println("조회한 로우 수 : " + elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return elist;
	}
	public List<Map<String, Object>> empList2(Map<String, Object> pMap){
		logger.info("empList2 호출 성공");
		List<Map<String, Object>> elist = null;
		String resource = "orm/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession 객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			elist = sqlSes.selectList("empList2", Integer.parseInt(pMap.get("empno").toString()));
			System.out.println("조회한 로우 수 : " + elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return elist;
	}
	public List<Map<String, Object>> empList3(EmpVO eVO){
		logger.info("empList2 호출 성공");
		List<Map<String, Object>> elist = null;
		String resource = "orm/mybatis/Configuration.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession 객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			elist = sqlSes.selectList("empList3", eVO);
			System.out.println("조회한 로우 수 : " + elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return elist;
	}
	
	public void deptTime(Map<String, String> pMap) {
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			System.out.println(sqlSes.selectList("currentTime", pMap));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		SqlMapEmpDao eDao = new SqlMapEmpDao();
		Map<String, Object> rMap = null;
//		eDao.empList(null);
		eDao.deptTime(null);
	}
}
