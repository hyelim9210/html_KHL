package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapCommonDao {
	
	Logger logger = Logger.getLogger(SqlMapCommonDao.class);
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	
	public List<Map<String, Object>> getZipcode(Map<String, Object> pMap){
		logger.info("getZipcode 호출 성공");
		List<Map<String, Object>> zipcodeList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlMapper.openSession();
			zipcodeList = session.selectList("zipcodeSearch", pMap);
			
		} catch (Exception e) {
			System.out.println("[[getZipcode()]]");
			e.printStackTrace();
		}
		
		return zipcodeList;
	}
	
	/**********************************************************
	 * 주소 검색 - 도 정보를 조회하는 메소드
	 * @param pMap
	 * @return List<Map<String, Object>>
	 * 작성자 : 김혜림
	 * 2020년 04월 24일
	 */
	public List<Map<String, Object>> getZDOList(Map<String, Object> pMap){
		logger.info("getZDOList 호출 성공");
		List<Map<String, Object>> zdoList = null;
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlMapper.openSession();
			zdoList = session.selectList("getZDOList", pMap);
			
		} catch (Exception e) {
			System.out.println("[[getZDOList()]]");
			e.printStackTrace();
		}
		
		return zdoList;
	}
	
	/**********************************************************
	 * 주소 검색 - 시 정보를 조회하는 메소드
	 * @param pMap
	 * @return List<Map<String, Object>>
	 * 작성자 : 김혜림
	 * 2020년 04월 24일
	 */
	public List<Map<String, Object>> getSiGuList(Map<String, Object> pMap){
		logger.info("getSiGuList 호출 성공");
		List<Map<String, Object>> siGuList = null;
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlMapper.openSession();
			siGuList = session.selectList("getSiGuList", pMap);
			
		} catch (Exception e) {
			System.out.println("[[getSiGuList()]]");
			e.printStackTrace();
		}
		
		return siGuList;
	}
	
	/**********************************************************
	 * 주소 검색 - 동 정보를 조회하는 메소드
	 * @param pMap
	 * @return List<Map<String, Object>>
	 * 작성자 : 김혜림
	 * 2020년 04월 24일
	 */
	public List<Map<String, Object>> getDongList(Map<String, Object> pMap){
		logger.info("getDongList 호출 성공");
		List<Map<String, Object>> dongList = null;
		
		try {
		
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlMapper.openSession();
			dongList = session.selectList("getDongList", pMap);
			
		} catch (Exception e) {
			System.out.println("[[getDongList()]]");
			e.printStackTrace();
		}
		return dongList;
	}
	
}
