package manage;

public class Course {
	private int courseID;              //�γ̺�
	private String courseName;         //�γ���
	private float credit;              //ѧ��
	
	public Course() {}
	
	public Course(int courseID, String courseName, float credit) {
		this.courseID = courseID;
		this.courseName = courseName;
		this.credit = credit;
	}
	
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public float getCredit() {
		return credit;
	}
	public void setCredit(float credit) {
		this.credit = credit;
	}
}
