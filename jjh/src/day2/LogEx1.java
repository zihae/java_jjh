package day2;

public class LogEx1 {
	public static void main(String[] args) {
		//&&������ ����. A���� �Ǻ��� �̿�
		int score = 95;
		//score�� 100�� �����̰�, score�� 90�� �̻��̴�.
		//score�� 100������ �۰ų� ����, score�� 90������ ũ�ų� ����.
		boolean isA = score <= 100 && score >= 90;
		System.out.println(score + "���� A�����ΰ�?" + isA );
		
		// ||������ ����. ���� ����
		//drierLicense, registrationCard�� true�̸� ����, false�� ����
		boolean driverLicense = true, registrationCard = true;
		//������������ �ְų� �ֹε������ ������ ���� ����
		boolean testOk = driverLicense; || registrationCard;
		System.out.println("���� ���� ����?" + testOk);
		
		//!������ ����. ���� ����
		//isMale�� true�̸� ����. false�̸� ����
		boolean isMale = true;
		System.out.println("�����ΰ�?" + isMale);
		System.out.println("�����ΰ�" + !isMale); 
		//isA
	
	}
}
