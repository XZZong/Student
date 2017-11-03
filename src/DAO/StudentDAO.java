package DAO;

import db.DatabaseHelper;
import manage.Student;
import util.StudentMapper;

import java.util.List;

/**
 * Created by admin on 2017/11/2.
 */
public class StudentDAO {
    //登录时调用这个
    public static Student search(String id, String password) {
        String sql = String.format("select * from student where student_id = '%s' and password = '%s'",
                id,password);
        //不同情况下选择不同的Mapper
        return (Student) DatabaseHelper.queryObject(sql,new StudentMapper());
    }

    public static List getAll() {
        String sql = "select * from student";
        return DatabaseHelper.queryList(sql, new StudentMapper());
    }

    public static boolean deleteStudent(String studentID) {
        String sql = String.format("delete from student where student_id = '%s'",studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }

    public static boolean insertStudent(String studentID, String studentName, String className, boolean sex,
                                 String birth, String nation, String entrance, String specialty) {
        String sql = String.format("INSERT INTO student (student_id, student_name, class_name, sex, birth, nation, entrance_date, specialty, password) " +
                "values('%s','%s','%s',%b,'%s','%s','%s','%s','%s')", studentID, studentName, className, sex, birth, nation, entrance, specialty, studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }

    public static boolean updateStudent(String studentID, String studentName, String className, boolean sex,
                                        String birth, String nation, String entrance, String specialty) {
        String sql = String.format("update student set student_name = '%s', class_name = '%s', sex = %b, birth = '%s', " +
                "nation = '%s', entrance_date = '%s', specialty = '%s' where student_id = '%s'"
                , studentName, className, sex, birth, nation, entrance, specialty, studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }

    public static boolean updatePwd(String studentID, String password, String newPassword) {
        String sql = String.format("select * from student where student_id = '%s' and password = '%s'", studentID, password);
        Student student = (Student) DatabaseHelper.queryObject(sql, new StudentMapper());
        if (student == null)
            return false;
        sql = String.format("update student set password = '%s' where student_id = '%s'",newPassword, studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }
}
