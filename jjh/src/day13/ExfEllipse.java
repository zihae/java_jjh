package day13;
/* ExfShape을 상속받아 ExfRect 클래스와 ExfEllipse 클래스를 만드세요. */
public class ExfEllipse extends ExfShape {

	@Override
	public void draw() {
		System.out.println("사각형");
		
	}
	public ExfEllipse(int x1, int y1, int x2, int y2) {
		super(x1,y1,x2,y2);
	}

	
}
