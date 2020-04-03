package web.crawling;

public class SplitTest {

	public static void main(String[] args) {
		String test = "첫번째<t>두번째<t>세번쨰<t>네번째";
		String ttt[] = null;
		ttt = test.split("<t>");
		for(String a : ttt) {
			System.out.println(a);
			
		}
		System.out.println(ttt[2]);
	}
	
}
