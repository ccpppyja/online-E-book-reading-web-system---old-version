package s108122020015.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

public class DataSourceUtils {
    private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return conn;
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}