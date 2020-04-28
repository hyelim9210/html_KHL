package json.ui;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class JsonDeptList {

	public List<Map<String, Object>> getDeptList() {
		List<Map<String, Object>> deptList = new ArrayList<Map<String,Object>>();
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("rno", 1);
		rmap.put("deptno", 10);
		rmap.put("dname", "총무부");
		rmap.put("loc", "인천");
		deptList.add(rmap);
		rmap = new HashMap<String, Object>();
		rmap.put("rno", 2);
		rmap.put("deptno", 20);
		rmap.put("dname", "영업부");
		rmap.put("loc", "서울");
		deptList.add(rmap);
		rmap = new HashMap<String, Object>();
		rmap.put("rno", 3);
		rmap.put("deptno", 30);
		rmap.put("dname", "인사부");
		rmap.put("loc", "부산");
		deptList.add(rmap);
		
		return deptList;
	}////리스트를 만들었다. 이제 이걸 제이슨 파일로 꺼내보자.
	///어떤 걸 하든 자바가 기본이다.
	public static void main(String[] args) {
		JsonDeptList jdl = new JsonDeptList();
		List<Map<String, Object>> deptList = jdl.getDeptList();
		Gson g = new Gson();
		String temp = g.toJson(deptList);///json 파일로 만들어준다.
		System.out.println(temp);
	}
	
}
