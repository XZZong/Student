package db;

import util.RowMapper;

import java.lang.reflect.Method;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2017/11/2.
 */
public class DatabaseHelper {
    static String strCon = "jdbc:mysql://127.0.0.1:3306/student";
    static String strUser = "root";
    static String strPwd = "0804";

    private static Connection getConnection() throws Exception{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        return DriverManager.getConnection(strCon,strUser,strPwd);
    }

    private static void clear(ResultSet rs, Statement statement, Connection con) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Object queryObject(String sql, RowMapper rowMapper) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
                return rowMapper.map(rs);
            }
            return null;
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }finally {
            clear(null,ps,con);
        }
    }

    public static List<Object> queryList(String sql, RowMapper rowMapper) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Object> list = new ArrayList<>();
            while (rs.next()) {
                Object object = rowMapper.map(rs);
                list.add(object);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            clear(rs, ps, con);
        }
    }

    public static int queryCount(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            //所有的查询count语句都把count（*）XX为count
            rs = ps.executeQuery();
            if (rs.first()) {
                return rs.getInt("count");
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            clear(rs, ps, con);
        }
    }

    public static int update(String sql) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            clear(null, ps, con);
        }
    }

    //获取自增id
    public static long create(String sql) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.first()) {
                return rs.getLong(1);
            }
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            clear(rs, ps, con);
        }
    }
}
