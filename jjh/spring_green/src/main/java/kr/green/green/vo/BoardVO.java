package kr.green.green.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bd_num;
	private String bd_title;
	private String bd_contents;
	private Date bd_reg_date;
	private Date bd_up_date;
	private String bd_type;
	private String bd_me_id;
	private int bd_ori_num;
	private String bd_del;
	private Date bd_del_date;
	private int bd_views;
	
	public String getBd_reg_date_str() {
		//Date를 String으로 형변환
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = format.format(bd_reg_date);
		return str;
	}
	
	public String getTypeTitle() {
		if(bd_type != null && bd_type.equals("notice"))
			return "공지사항";
		if(bd_type != null && bd_type.equals("qna"))
			return "QnA";
		return "게시글";
	}
	
	public boolean isAccessAuthority(String authority) {
		if(bd_type.equals("normal") || bd_type.equals("qna"))
			return true;
		if(bd_type.equals("notice") && 
				(authority.equals("admin") || authority.equals("super admin")))
			return true;
		return false;
	}

}
