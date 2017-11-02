package manage;

public class Course {
	private int courseID;              //课程号
	private String courseName;         //课程名
	private float credit;              //学分
	
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
