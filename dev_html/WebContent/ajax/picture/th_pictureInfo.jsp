<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//192.168.0.191:8000/dev_html/ajax/th_pictureInfo.jsp?id=picture2.jpg
	//이런 주소가 될 것이다.
	String img = request.getParameter("id");//id를 파라미터로 받아온다. id를 비교할 것이다.
	out.print("img : " + img);//화면이 없어도(디자이너가 없어도) 단위 테스트가 가능해야한다.
	String imgs[] = {"zzangku.png", "chulsoo.png", "mangku.png", "hoony.png"};
	String cImg = null;
	String cInfo = null;
	for(int i=0; i<imgs.length; i++){
		if(img.equals(imgs[i])){
			//out.print("imgs[i] : " + imgs[i]);
			cImg = imgs[i];
			cInfo = imgs[i];
		}
	}
%>
<img src = "./<% out.print(cImg); %>" cImg width ='400px' height ='270px'>
<div><% out.print(cInfo); %></div>