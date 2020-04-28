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

import com.vo.BookVO;

public class BookDao {

	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(BookDao.class);
	
	public List<Map<String, Object>> getBookList_t(Map<String, Object> pMap) {
		List<Map<String, Object>> bList = null;
		logger.info("[[info]] : book_title : " + pMap.get("book_title"));
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);  
			session = sqlMapper.openSession();//여기서 의존성 객체주입이 일어난다ㅣ.
			bList = session.selectList("getBookList", pMap);
		} catch (Exception e) {
			System.out.println("=====================\n"+e.getStackTrace());
			e.toString();
			e.printStackTrace();
			System.out.println("=========================");
		}
		return bList;
	}
	
	/**************
	 * 
	 * @param pMap - 사용자가 자동완선 텍스트박스에 입력한 도서 제목정보
	 * @return - 사용자가 입력한 도서 정보를 선분조건(Like패턴)으로 검색하여 결과 반환
	 */
	public List<Map<String, Object>> getBookList(Map<String, Object> pMap) {
		List<Map<String, Object>> bList = null;
		logger.info("info");
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);  
			session = sqlMapper.openSession();
			bList = session.selectList("bookList", pMap);
			
		} catch (Exception e) {
			System.out.println("=====================\n"+e.getStackTrace());
			e.toString();
			e.printStackTrace();
			System.out.println("=========================");
		}
		return bList;
	}
	
	public List<BookVO> getBookListVO(BookVO bVO) {
		List<BookVO> voList = null;
		logger.info("info");
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);  
			session = sqlMapper.openSession();
			voList = session.selectList("bookListVO", bVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return voList;
	}
	public static void main(String[] args) {
		BookDao b = new BookDao();
		System.out.println(b.getBookList(null));
	}
}
