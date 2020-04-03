package project.restaurant;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class RestInsView extends JDialog implements ActionListener {
	//jframe과 달리 jDialog는 부모창이 닫혔을 때 자원 회수가 들어간다
	
	//선언부
	JButton jbtn_save = new JButton("저장");
	JButton jbtn_close = new JButton("닫기");
	
	JPanel jp_north = new JPanel();
	
	JLabel		jlb_name	= new JLabel("식당이름");
	JTextField	jtf_name	= new JTextField();
	JLabel		jlb_tel		= new JLabel("전화번호");
	JTextField	jtf_tel		= new JTextField();	////// 수정, 입력 때 얘는 입력 못 하게 해야함
	JLabel		jlb_addr	= new JLabel("주소");
	JTextField	jtf_addr	= new JTextField();
	JLabel		jl_photo	= new JLabel("사진");
	JTextField	jtf_photo	= new JTextField();
	JLabel		jl_info		= new JLabel("식당소개");
	JTextArea	jta_info	= new JTextArea();
	JScrollPane	js_info		= new JScrollPane(jta_info);
	JLabel		jlb_time	= new JLabel("영업시간");
	JTextField	jtf_time	= new JTextField();
	JLabel		jlb_lat		= new JLabel("위도");
	JTextField	jtf_lat		= new JTextField();
	JLabel		jlb_lng		= new JLabel("경도");
	JTextField	jtf_lng		= new JTextField();
	
	RestaurantDao rDao = new RestaurantDao();
	
	//생성자
	public RestInsView() {
		initDisplay();
	}
	
	//화면처리부
	public void initDisplay() {
		this.setLayout(null);//좌표값으로 배치하기 위해 null로 처리

		jbtn_save.addActionListener(this);
		jbtn_close.addActionListener(this);
		
		jlb_name.setBounds(20, 50, 100, 20);
		jtf_name.setBounds(120, 50, 150, 20);
		jlb_tel.setBounds(20,80,90,20);
		jtf_tel.setBounds(120,80,130,20);
		jlb_addr.setBounds(20,110,90,20);
		jtf_addr.setBounds(120,110,230,20);
		jlb_time.setBounds(20,140,90,20);
		jtf_time.setBounds(120,140,150,20);
		jlb_lat.setBounds(20,170,90,20);
		jtf_lat.setBounds(120,170,100,20);
		jlb_lng.setBounds(20,200,90,20);
		jtf_lng.setBounds(120,200,100,20);
		jl_photo.setBounds(20, 230, 90, 20);
		jtf_photo.setBounds(120, 230, 150, 20);
		jl_info.setBounds(20,260,90,20);
		js_info.setBounds(120,260,200,100);
		jbtn_close.setBounds(160, 370, 60, 30);
		jbtn_save.setBounds(230, 370, 60, 30);
		
		this.add(jlb_name);
		this.add(jtf_name);
		this.add(jlb_tel);
		this.add(jtf_tel);
		this.add(jlb_addr);
		this.add(jtf_addr);
		this.add(jl_photo);
		this.add(jtf_photo);
		this.add(jl_info);
		this.add(js_info);
		this.add(jlb_time);
		this.add(jtf_time);
		this.add(jlb_lat);
		this.add(jtf_lat);
		this.add(jlb_lng);
		this.add(jtf_lng);
		
		this.add(jbtn_close);
		this.add(jbtn_save);
		
		this.setSize(400,650);
		this.setVisible(true);
	}
	
	public static void main(String[] args) {
		new RestInsView();
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		Object obj = e.getSource();
		
		if(obj == jbtn_close) {
			//닫기 버튼 눌렀을 때 종료되도록 처리
			System.exit(1);
		}
		
		if(obj == jbtn_save) {
			Map<String, Object> pMap = new HashMap<String, Object>();
			pMap.put("res_name", jtf_name.getText());
			pMap.put("res_tel", jtf_tel.getText());
			pMap.put("res_addr", jtf_addr.getText());
			pMap.put("res_photo", jtf_photo.getText());
			pMap.put("res_info", jta_info.getText());
			pMap.put("res_time", jtf_time.getText());
			pMap.put("lat", jtf_lat.getText());
			pMap.put("lng", jtf_lng.getText());
			int result = rDao.resultINS(pMap);
			
			if(result == 1) {
				JOptionPane.showMessageDialog(this, "등록 되었습니다.");
			}
			else {
				JOptionPane.showMessageDialog(this, "등록 실패하였습니다.");
			}
			this.dispose();
			this.setVisible(false);
		}
		
		
	}
	
}
