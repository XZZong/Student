package util;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by admin on 2017/11/2.
 */
public interface RowMapper {
    Object map(ResultSet resultSet) throws SQLException;
}
