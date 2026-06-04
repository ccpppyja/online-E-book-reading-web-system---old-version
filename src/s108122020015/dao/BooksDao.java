package s108122020015.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import s108122020015.model.Books;
import s108122020015.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class BooksDao {
    private final QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

    public List<Books> findAll() throws SQLException {
        return qr.query("select * from book", new BeanListHandler<Books>(Books.class));
    }

    public List<Books> search(String keyword) throws SQLException {
        String sql = "select * from book where title like ?";
        String searchKeyword = "%" + keyword + "%";
        return qr.query(sql, new BeanListHandler<Books>(Books.class), searchKeyword);
    }

    public Books findById(int id) throws SQLException {
        String sql = "select * from book where id = ?";
        return qr.query(sql, new BeanHandler<Books>(Books.class), id);
    }

    public int getTotalCount() throws SQLException {
        String sql = "select count(*) from book";
        return qr.query(sql, new ScalarHandler<Long>()).intValue();
    }

    public int insert(Books book) throws SQLException {
        String sql = "insert into book (title, author, genre, publishDate, description, fileUrl, imageUrl) values(?,?,?,?,?,?,?)";
        return qr.update(sql, book.getTitle(), book.getAuthor(), book.getGenre(), book.getPublishDate(), book.getDescription(), book.getFileUrl(), book.getImageUrl());
    }
    public int update(Books book) throws SQLException {
        String sql = "update book set author=?,genre=?,publishDate=?,description=?,fileUrl=?,imageUrl=? where id=?";
        return qr.update(sql, book.getAuthor(), book.getGenre(), book.getPublishDate(), book.getDescription(), book.getFileUrl(), book.getImageUrl(), book.getId());
    }

    public int delete(int id) throws SQLException {
        String sql = "delete from book where id = ?";
        return qr.update(sql, id);
    }

    public List<Books> getByPage(int pageNumber, int pageSize) throws SQLException {
        String sql = "select * from book limit ?,?";
        int offset = (pageNumber - 1) * pageSize;
        return qr.query(sql, new BeanListHandler<>(Books.class), offset, pageSize);
    }
}
