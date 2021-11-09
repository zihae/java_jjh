package day10;


public class Rect1 {
	/*도형 직사각형을 나타내는 클래스를 생성하고, 객체를 만들어 테스트하세요.
	 *매개변수: 시작점과 가로,세로	
	 */
	private int x, y;
	private double width, height;
	
	//기본 생성자
	Rect1(){}

	//매개변수 (갈색)가 있는 생성자
	public Rect1(int x, int y, double width, double height) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	//사각형 정보 출력 기능 ( 내가 가지고 있는 정보를 출력하는 것이기 때문에 매개변수 필요 x)
	public void print() {
		System.out.println("---사각형---");
		System.out.println("시작점 : " + x + "," + y);
		System.out.println("가로 : " + width);
		System.out.println("세로 : " + height);
		System.out.println("-----------");
			
	}
	//시작점 이동 기능
	public void move(int x,int y) {
		this.x = x; this.y=y;
	}
	//사각형 크기 변경 기능
	public void resize(int width, int hegiht) {
		this.width = width; this.height =hegiht;
	}
	
	
	
	
	
}
