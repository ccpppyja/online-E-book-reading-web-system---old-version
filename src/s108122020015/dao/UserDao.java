package s108122020015.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import s108122020015.model.User;
import s108122020015.utils.DataSourceUtils;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public class UserDao {
    private final QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

    public List<User> findAll() throws SQLException {
        String sql = "select * from user";
        return qr.query(sql, new BeanListHandler<User>(User.class));
    }

    public User findById(int id) throws SQLException {
        String sql = "select * from user where id = ?";
        return qr.query(sql, new BeanHandler<User>(User.class), id);
    }

    public User findByUsername(String username) throws SQLException {
        String sql = "select * from user where username = ?";
        return qr.query(sql, new BeanHandler<>(User.class), username);
    }

    public User findByEmail(String email) throws SQLException {
        String sql = "select * from user where email = ?";
        return qr.query(sql, new BeanHandler<>(User.class), email);
    }

    public int insert(User user) throws SQLException {
        String sql = "insert into user(username, password, email) values(?,?,?)";
        int id = qr.insert(sql, new ScalarHandler<BigInteger>(), user.getUsername(), user.getPassword(), user.getEmail()).intValue();
        user.setId(id);
        return id;
    }

    public int update(User user) throws SQLException {
        String sql = "update user set password = ?, email = ? where username = ?";
        return qr.update(sql, user.getPassword(), user.getEmail(), user.getUsername());
    }

    public int delete(int id) throws SQLException {
        String sql = "delete from user where id = ?";
        return qr.update(sql, id);
    }
}
