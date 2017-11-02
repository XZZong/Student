package manage;

public class Student {
	private String studentID;           //���
	private String studentName;         //����
	private String className;                //�༶��
	private boolean sex;                   //�Ա�
	private String birth;            //��������
	private String nation;              //����
	private String entrance;         //��ѧ����
	private String specialty;           //רҵ
	private String password;
	
	public Student() {}
	
	public Student(String studentID, String password) {
		this.studentID = studentID;
		this.password = password;
	}
	
	public Student(String studentID, String studentName, String className, boolean sex, 
			String birth, String nation, String entrance, String specialty, String password) {
		this.studentID = studentID;
		this.studentName = studentName;
		this.className = className;
		this.sex = sex;
		this.birth = birth;
		this.nation = nation;
		this.entrance = entrance;
		this.specialty = specialty;
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEntrance() {
		return entrance;
	}

	public void setEntrance(String entrance) {
		this.entrance = entrance;
	}

	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
