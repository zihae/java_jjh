package day17;

import java.util.ArrayList;

public class ExbStudent {

		private int grade, classNum, num;
		private String name;
		private ArrayList<ExbScore> score;

		public ExbStudent(int grade, int classNum, int num, String name) {
			this.grade = grade;
			this.classNum = classNum;
			this.num = num;
			this.name = name;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + classNum;
			result = prime * result + grade;
			result = prime * result + num;
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			ExbStudent other = (ExbStudent) obj;
			if (classNum != other.classNum)
				return false;
			if (grade != other.grade)
				return false;
			if (num != other.num)
				return false;
			return true;
		}

		public int getGrade() {
			return grade;
		}

		public void setGrade(int grade) {
			this.grade = grade;
		}

		public int getClassNum() {
			return classNum;
		}

		public void setClassNum(int classNum) {
			this.classNum = classNum;
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public ArrayList<ExbScore> getScore() {
			return score;
		}

		public void setScore(ArrayList<ExbScore> score) {
			this.score = score;
		}

		@Override
		public String toString() {
			return "ExbStudent [grade=" + grade + ", classNum=" + classNum + ", num=" + num + ", name=" + name
					+ ", score=" + score + "]";
		}
		
		
		
		

	}


