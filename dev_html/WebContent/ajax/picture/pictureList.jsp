<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Map<String, String> pMap = null;
List<Map<String, String>> pList = new ArrayList<>();

pMap = new HashMap<>();
pMap.put("pic_name", "짱구");
pMap.put("pic_addr", "zzangku.png");
pMap.put("pic_info", "떡잎유치원에 다니는 해바라기 반 유치원생."
		+ "액션 가면을 좋아하고 예쁜 누나와 초코비를 좋아한다. 늘 장난을 치며 주위 사람들을"
		+ "곤란하게 하기도 하지만 미워할 수 없는 귀염둥이!");

pList.add(pMap);
pMap = new HashMap<>();
pMap.put("pic_name", "철수");
pMap.put("pic_addr", "chulsoo.png");
pMap.put("pic_info", "짱구의 유치원 친구. 부잣집 도련님 스타일의 잘난척쟁이다. 하지만 정말로 똑똑한 깔끔 모범생으로 피아노학원, 영어학원 등 늘 학원에 다니느라 바쁘다. 유난히 짱구와 신경전이 심하지만 친구들과 함께하는 모험은 꼭 빠지지 않는다.");
pList.add(pMap);

pMap = new HashMap<>();
pMap.put("pic_name", "훈이");
pMap.put("pic_addr", "hoony.png");
pMap.put("pic_info", "짱구의 유치원 친구. 겁 많은 울보로 유리의 소꿉놀이에 가담할 때마다 피해자가 된다. 꼼꼼한 성격으로 정리가 안 된 방이나 약속을 지키지 않는 것을 싫어한다. 성대모사가 특기.");
pList.add(pMap);

pMap = new HashMap<>();
pMap.put("pic_name", "맹구");
pMap.put("pic_addr", "mangku.png");
pMap.put("pic_info", "짱구의 유치원 친구. 특히 훈이와 친하다. 늘 콧물을 흘리며 어리숙하게 보이지만 가끔씩 날카로운 지적을 하거나 유치원생으로서 할 수 없는 고도의 작업을 하는 등 종잡을 수 없는 성격. 취미는 특이한 돌 모으기. 특기는 '존재감을 없애는 일'.");
pList.add(pMap);

pMap = new HashMap<>();
pMap.put("pic_name", "유리");
pMap.put("pic_addr", "yooree.png");
pMap.put("pic_info", "짱구의 유치원 친구. 소꿉놀이를 좋아하며 예전에는 울보에 상냥하고 어른스러운 여자아이였으나 엄마의 영향으로 성격이 대범하게 변했다. 늘 토끼 인형을 안고 다니는 유리는 귀엽고 사랑스럽다.");
pList.add(pMap);

String img = request.getParameter("id");
String cImg = null;
String cInfo = null;
for(int i = 0; i < pList.size(); i++){
	if(pList.get(i).get("pic_addr").equals(img)){
		cImg = pList.get(i).get("pic_addr");
		cInfo = pList.get(i).get("pic_info");
	}
}
%>    
<img src = "./<% out.print(cImg); %>" width ='300px' height ='300px'>
<div style = "width:300px; height:300px;"><% out.print(cInfo); %></div>
