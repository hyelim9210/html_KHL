package com.dept;

import java.util.HashMap;
import java.util.Map;

public class HashMapBinder {
	
	Map<String, Object> dataMap = new HashMap<>();
	
	public Map<String, Object> getDataMap(Map<String, String[]> pMap){
		Object[] keys = pMap.keySet().toArray();
		for(int i = 0; i<keys.length; i++){
			if(pMap.get(keys[i]) != null) {
				dataMap.put(keys[i].toString(), pMap.get(keys[i])[0]);
			}
		}
		return dataMap;
	}
}
