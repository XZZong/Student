package util;

import manage.Student;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by admin on 2017/11/2.
 */
public class StudentMapper implements RowMapper {
    @Override
    public Student map(ResultSet rs) throws SQLException {
        Student student = new Student();
        student.setStudentID(rs.getString("student_id"));
        student.setStudentName(rs.getString("student_name"));
        student.setClassName(rs.getString("class_name"));
        student.setSex(rs.getBoolean("sex"));
        student.setBirth(rs.getString("birth"));
        student.setNation(rs.getString("nation"));
        student.setEntrance(rs.getString("entrance_date"));
        student.setSpecialty(rs.getString("specialty"));
        student.setPassword(rs.getString("password"));
        return student;
    }
}
