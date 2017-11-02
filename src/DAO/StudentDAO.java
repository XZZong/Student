package DAO;

import db.DatabaseHelper;
import manage.Student;
import util.StudentMapper;

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

    public static List<Student> getAll() {
        String sql = "select * from student";
//        List<Student> list = (List<Student>) DatabaseHelper.queryList(sql,new StudentMapper(), Student.class);
//        return list;
        return null;
    }
}
