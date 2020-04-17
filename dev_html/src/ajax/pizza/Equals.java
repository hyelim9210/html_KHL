package ajax.pizza;

public class Equals {

	public static void main(String[] args) {
		
		String s = "안녕";
		String s1 =  new String("안녕");
		if(s==s1) {//주소 번지를 비교
			System.out.println("s==s1");
		}
		else if(s.equals(s1)) {
			System.out.println("s.equals(s1)");
		}
		
	}
	
}
