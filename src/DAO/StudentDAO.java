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

    public static List<Student> getAll() {
        String sql = "select * from student";
        List list = DatabaseHelper.queryList(sql, new StudentMapper(), Student.class);
        List<Student> list1 = new ArrayList<>();
        assert list != null;
//        这里进行类型转换有点浪费，到底如何返回Student类型的list
        for (Object aList : list) {
            Student student = (Student) aList;
            list1.add(student);
        }
//        List<Student> list = (List<Student>) DatabaseHelper.queryList(sql,new StudentMapper(), Student.class);
//        return list;
        return list1;
    }

    public static boolean deleteStudent(String studentID) {
        String sql = String.format("delete * from student where student_id = '%s'",studentID);
        int updateCount = DatabaseHelper.update(sql);
        return updateCount > 0;
    }
}
