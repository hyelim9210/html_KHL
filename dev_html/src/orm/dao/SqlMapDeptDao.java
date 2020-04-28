package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapDeptDao {
	
	SqlSessionFactory sqlMapper = null;
	Logger log = Logger.getLogger(this.getClass());
	public List<Map<String, Object>> getDeptList(Map<String, Object> pMap){
		List<Map<String, Object>> dList = null;
		log.info("[[INFO]]");
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sqlMapper.openSession();
			dList = session.selectList("deptList", pMap);
		} catch (Exception e) {
			e.toString();
			System.out.println(e.getStackTrace());
			e.printStackTrace();
		}
		
		return dList;
	}
	
}
