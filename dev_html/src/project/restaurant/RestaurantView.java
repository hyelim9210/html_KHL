package project.restaurant;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class RestaurantView extends JFrame implements ActionListener {

	//선언부
	JButton jbtn_ins = new JButton("입력");
	JButton jbtn_upd = new JButton("수정");
	JButton jbtn_del = new JButton("삭제");
	JButton jbtn_sel = new JButton("조회");
	
	JPanel jp_north = new JPanel();
	
	String[] cols = {"식당명", "주소", "전화번호"};
	String[][] data = new String[0][3];
	DefaultTableModel dtm_rest = new DefaultTableModel(data, cols);
	JTable jtb_rest = new JTable(dtm_rest);
	//scrollpane 자체를 jframe에 직접 붙여도 된다. 그래서 jp_center를 만들지 않았다.
	JScrollPane jsp_rest = new JScrollPane(jtb_rest
											, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED
											, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	//생성자
	public RestaurantView() {
		initDisplay();
	}
	
	//화면 처리부
	public void initDisplay() {
		//디버그모드 연습해보려면  initDisplay 시작부분(public)에서 더블클릭, 마지막 중괄호에서 북마크 추가
		//debug as - java application
		
		jbtn_ins.addActionListener(this);
		jbtn_upd.addActionListener(this);
		jbtn_del.addActionListener(this);
		jbtn_sel.addActionListener(this);
		
		jp_north.setLayout(new FlowLayout(FlowLayout.LEFT));
		jp_north.add(jbtn_ins);
		jp_north.add(jbtn_upd);
		jp_north.add(jbtn_del);
		jp_north.add(jbtn_sel);
		
		this.add("North", jp_north);
		this.add("Center", jsp_rest);
		
		
		this.setTitle("식당 정보");
		this.setVisible(true);
		this.setSize(800, 550);
	}
	
	RestaurantDao rDao = new RestaurantDao();
	//메인메소드
	public static void main(String[] args) {
		new RestaurantView();
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		Object obj = e.getSource();
		if(obj == jbtn_ins) {
			System.out.println("입력 버튼 호출 성공");
			new RestInsView();
		}
		else if(obj == jbtn_upd) {
			System.out.println("수정 버튼 호출 성공");
		}
		else if(obj == jbtn_del) {
			System.out.println("삭제 버튼 호출 성공");
		}
		else if (obj == jbtn_sel) {
			System.out.println("조회 버튼 호출 성공");
			List<Map<String, Object>> rList = rDao.restList();
			Vector v = null;
			for(Map<String, Object> rMap : rList) {
				v = new Vector();
				v.add(rMap.get("res_name"));
				v.add(rMap.get("res_addr"));
				v.add(rMap.get("res_tel"));
				dtm_rest.addRow(v);
			}
		}
		
	}
	
}
