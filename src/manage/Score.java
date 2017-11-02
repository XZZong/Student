package manage;

public class Score {
	private String studentID;         //ѧ��
	private String courseName;             //�γ̺�
	private float score;              //����
	private int semester;           //ѧ��
	private String year;               //ѧ��
	
	public Score() {}
	
	public Score(String studentID, String courseName, float score, int semester, String year) {
		this.studentID = studentID;
		this.courseName = courseName;
		this.score = score;
		this.semester = semester;
		this.year = year;
	}
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
}
