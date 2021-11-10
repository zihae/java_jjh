package day11;

public class ClassRectEx1 {

	public static void main(String[] args) {
		Rect r1 = new Rect();
		r1.print();
		Point p1 = new Point(0,0);
		Point p2 = new Point(10,10);
		Rect r2 = new Rect(p1,p2);
		r2.print();
		r2.move(10, 10);
		r2.print();
		r2.resize(5, 15);
		r2.print();
		p1.print();
		p1.move(15, 25);
		r2.print();
	}

}
/*클래스의 멤버변수가 참조변수일때 변경한 값을 공유할지 안 할지 결정하고, 공유하지 않는다면 
공유 되지 않도록 복사 생성자를 만듦 */