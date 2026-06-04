package s108122020015.service;

import s108122020015.dao.BookmarksDao;
import s108122020015.model.Bookmarks;
import s108122020015.model.Books;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookmarksService {
    BookmarksDao bookmarksDao = new BookmarksDao();

    public Bookmarks findById(int id) throws SQLException {
        try {
            return bookmarksDao.findById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Bookmarks> findByUser(int userId) throws SQLException {
        try {
            return bookmarksDao.findByUser(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return List.of();
    }

    public Books findByBookId(int bookId) throws SQLException {
        try {
            return bookmarksDao.findByBookId(bookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addBookmarks(Bookmarks bookmarks) {
        try {
            return bookmarksDao.insert(bookmarks) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteBookmarks(int id) {
        try {
            return bookmarksDao.delete(id) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
