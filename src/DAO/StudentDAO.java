package DAO;

import db.DatabaseHelper;
import manage.Student;
import util.StudentMapper;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2017/11/2.
 */
public class StudentDAO {
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
        String sql = String.format("delete * from student where student_id = '%s'",studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }
}
