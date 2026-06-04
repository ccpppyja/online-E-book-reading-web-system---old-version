package s108122020015.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import s108122020015.model.Bookmarks;
import s108122020015.model.Books;
import s108122020015.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class BookmarksDao {
    private final QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

    public Bookmarks findById(int id) throws SQLException {
        String sql = "select bookmark.id, userId, bookId, title " +
                "from bookmark join book on bookId = book.id where bookmark.id = ?";
        return qr.query(sql, new BeanHandler<Bookmarks>(Bookmarks.class), id);
    }

    public List<Bookmarks> findByUser(int userId) throws SQLException {
        String sql = "select bookmark.id, userId, bookId, title " +
                "from bookmark join book on bookId = book.id where userId = ?";
        return qr.query(sql, new BeanListHandler<>(Bookmarks.class), userId);
    }

    public Books findByBookId(int bookId) throws SQLException {
        String sql = "select * from bookmark where bookId = ?";
        return qr.query(sql, new BeanHandler<>(Books.class), bookId);
    }

    public int insert(Bookmarks bookmark) throws SQLException {
        String sql = "insert into bookmark(userId,bookId) values(?,?)";
        return qr.update(sql, bookmark.getUserId(), bookmark.getBookId());
    }

    public int delete(int id) throws SQLException {
        String sql = "delete from bookmark where id = ?";
        return qr.update(sql, id);
    }
}
