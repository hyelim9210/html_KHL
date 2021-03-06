package web.crawling;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class WebCrawling {

	void methodA() {
		//웹 페이지의 내용을 읽어서 정보를 수집하고, 분석해서 활용하는 기술이 스크래핑이다. 요즘은 크롤링이라고 한다.
		//우리가 만든..? 웹 페이지의 내용을 읽어서 기록?을 해보자. 우선 예외처리가 필요하다.
		try {
			//크롤링을 할 URL입력을 받아야 한다. 우리가 했던 페이지 중에 하나를 선택해서 사용해보자.
			URL url = new URL("http://localhost:8000/dev_html/day4/deptList.jsp");
			InputStreamReader isr = new InputStreamReader(url.openStream());
			////해당 url 안에 있는 모든 정보를 읽어들인다. 
			BufferedReader br = new BufferedReader(isr);
			////방금 읽어들인 정보를 line 단위로 끊어서 확인할 수 있도록 BufferedReader에 저장시킨다.
			String tags = null;
			StringBuilder sb = new StringBuilder();
			int k = 0;
			while((tags = br.readLine())!=null) {//bufferedReader는 값을 저장시키고 유지할 수 없으니까
										//저장시키기 위해 sb로 다시 저장한다.
				System.out.println("k = " + ++k + "  // tags: " + tags);
				sb.append(tags);
			}
			System.out.println(sb.toString());
			br.close();
			//크롤링 시작 - 키(타이틀)
			List<String> titleList = new ArrayList<String>();
			String strs[] = sb.toString().split("<th>");
			for (int i = 0; i < strs.length; i++) {
				System.out.println("strs[" + i + "] = " + strs[i]);
			}//////
			String strs2[] = null;
			for(int i = 1; i<strs.length; i++) {
				strs2 = strs[i].split("</th>");
				titleList.add(strs2[0]);
			}
			for(String title : titleList) {
				System.out.println(title);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		WebCrawling wc = new WebCrawling();
		wc.methodA();
	}

}
