package manage;

public class Classes {
	private int classID;            //�༶���
	private String className;       //�༶��
	private int maxNum;             //�������
	private int sumNum;             //ѧ������
	private int grade;              //�꼶
	
	public Classes() {}
	
	public Classes(int classID, String className, int maxNum, int sumNum, int grade) {
		this.classID = classID;
		this.className = className;
		this.maxNum = maxNum;
		this.sumNum = sumNum;
		this.grade = grade;
	}
	
	public Classes(String className, int sumNum, int grade) {
		this.className = className;
		this.sumNum = sumNum;
		this.grade = grade;
	}
	
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getSumNum() {
		return sumNum;
	}
	public void setSumNum(int sumNum) {
		this.sumNum = sumNum;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
