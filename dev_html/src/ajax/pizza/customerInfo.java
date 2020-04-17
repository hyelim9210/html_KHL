package ajax.pizza;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class customerInfo {
	public static void main(String[] args) {
		
	//이름 : mem_name
	//주소 : mem_addr
	//번호 : mem_tel
	
	//데이터를 3건 추가해보자.
	List cList = new ArrayList<>();
	Map<String, Object> cMap = new HashMap<>();
	
	cMap.put("mem_name", "첫번째");
	cMap.put("mem_addr", "경기도 부천시 심곡동");
	cMap.put("mem_tel", "010-1234-5678");
	cList.add(cMap);

	cMap = new HashMap<>();
	cMap.put("mem_name", "두번째");
	cMap.put("mem_addr", "경기도 부천시 원미동");
	cMap.put("mem_tel", "010-3456-7890");
	cList.add(cMap);

	cMap = new HashMap<>();
	cMap.put("mem_name", "세번째");
	cMap.put("mem_addr", "경기도 부천시 중동");
	cMap.put("mem_tel", "010-7890-1234");
	cList.add(cMap);
	
	
	Gson g = new GsonBuilder().setPrettyPrinting().create();
	String jsonData = g.toJson(cList);
	System.out.println(jsonData);
	
//	String[] data = result.split(",");
//	for(String da : data) {
//		System.out.println(da);
//	}
	
	}
}
