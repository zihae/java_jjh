package day9;

public class ClassEx3 {

	public static void main(String[] args) {
		// 고등학교 학생 정보를 관리하기 위한 클래스를 생성하고, 테스트해보세요.
		// 그린고등학교에 다니는 1학년 1반 1번 홍길동 학생 객체를 생성하고, 학생 정보를 출력해보세요.
		HighSchoolStudent student1 = new HighSchoolStudent("그린고등학교", "홍길동", 1, 1, 1);
		student1.printInfo();		
		

	}

}

/* 고등학교 학생 정보를 관리하기 위한 클래스
 * 클래스 명: HighSchoolStudent
 * 멤버변수: 학교명, 학년, 반, 번호, 이름 String name, int classNum, int num
 * 멤버 메소드: 
 * - 정보를 출력하는 기능
 * 생성자
 * -기본 생성자: 
 * */

	class HighSchoolStudent {
		String schoolName, name; //멤버 변수
		int grade, classNum, num;
		
		public HighSchoolStudent() { //기본생성자
			/*schoolName = "고등학교"; 
			name = " " ;
			grade = 1;
			classNum = 1; 
			num = 1; */
			this("고등학교","", 1,1,1);
			System.out.println("this");
			
		}
		
		HighSchoolStudent(String schoolName, String name, int grade, int classNum, int num) { 
			//매개변수가 있는 생성자
			this.schoolName = schoolName;
			this.name = name;
			this.grade = grade;
			this.classNum = classNum;
			this.num = num;
		}

		public void printInfo() { //멤버 메소드
			System.out.println("학교 명 : " + schoolName);
			System.out.println("이름  : " + name);
			System.out.println("학년 : " + grade);
			System.out.println("반 : " + classNum);
			System.out.println("번호 : " + num);
	}
		
	}
	