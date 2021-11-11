package day12;

public class ExaShape {
	//도형 클래스 : 그림판에서 그려지는 모든 도형을 대표할 수 있는 클래스
	//day10에 Rect1, Rect2, Ellipse 클래스를 참고
	/* 모든 도형은 점선 안의 사각형 안에 그려진다. 그 사각형은 왼쪽 위의 점, 오른 쪽 아래점으로 표현할 수 있다
	 * 도형은 위치를 이동시킬 수 있다. (크기는 변하지 않음)
	 * 도형은 크기를 변화시킬 수 있다. (방향은 마음대로) 
	 * 도형은 방향에 상관없이 그릴 수 있다.
	 */
	//왼쪽위의 점, 오른쪽 아래 점
	protected int left, top; //왼쪽 위점
	protected int right, bottom; //오른쪽 아래점
	//도형을 그릴 때 대각선점 2개가 필요
	//그림판에서 그리는 거기 때문에 top <bottom의 좌표값이 크다
	public ExaShape(int x1, int y1, int x2, int y2) {
		left = x1 <x2 ? x1 :x2;
		right = x1 < x2 ? x2 : x1;
		top = y1 < y2 ? y1 : y2;
		bottom = y1 < y2 ? y2 : y1;
		/*
		if(x1 < x2) {
			left = x1;
			right = x2;
		}else {
			left = x2;
			right = x1;
		if(y1 < y2) {
			top = y1;
			bottom = y2;
		}else {
			top = y2;
			bottom = y1;
		}
		*/
	}
	//도형의 너비를 계산하는 기능
	public int getWidth() {
		return right - left;
	}
	//도형의 높이를 계산하는 기능
	public int getHeight() {
		return bottom -top;
	}
	//도형은 위치를 이동시킬 수 있다. (왼쪽 위의 점) //아래 코드 순서가 중요! 저대로 안쓰면 크기 변화가 됨
	public void move(int left, int top) {
		this.right = left + getWidth();
		this.bottom = top + getHeight();
		this.left = left;
		this.top = top;
				
	}
	//도형은 크기를 바꿀 수 있다(방향은 마음대로)
	/* direction: 1이면 우하방향, 2이면 좌하방향, 3이면 좌상방향, 4이면 우상방향 */
	public void resize(int width, int height, int direction) {
		if(width<0 || height <= 0) {
			System.out.println("잘못된 너비 또는 높이입니다.");
			return ; //void일때 강제종료 하고 싶을 때 -> return ;
		}
		switch(direction) {
		case 1: 
			right = left + width;
			bottom = top + height;
			break;
		case 2: 
			left = right - width;
			bottom = top + height;
			break;
		case 3: 
			left = right - width;
			top = bottom - height;
			break;
		case 4: 
			right = left + width;
			top = bottom - height;
			break;
		default:
			System.out.println("잘못된 방향입니다.");
		}
		
	}
	//도형을 그리기
	public void print() {
		
		System.out.println("----도형----");
		System.out.println("좌상점 : " + left + "," + top);
		System.out.println("우하점 : " + right + "," + bottom);
	}
}
