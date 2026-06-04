package s108122020015.service;

import s108122020015.dao.BooksDao;
import s108122020015.model.Books;
import s108122020015.model.Page;

import java.sql.SQLException;
import java.util.List;

public class BooksService {
    private final BooksDao booksDao = new BooksDao();

    public List<Books> getAllBooks() {
        try {
            return booksDao.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return List.of();
    }

    public Books getBooksById(int id) {
        try {
            return booksDao.findById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public long getTotalCount() {
        try {
            return booksDao.getTotalCount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean addBooks(Books books) {
        try {
            return booksDao.insert(books) > 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateBooks(Books books) {
        try {
            return booksDao.update(books) > 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteBooks(int id) {
        try {
            return booksDao.delete(id) > 0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public Page<Books> getByPage(int pageNumber, int pageSize) {
        Page<Books> page = new Page<Books>();
        try {
            int totalElements = booksDao.getTotalCount();
            page.setPage(pageNumber, pageSize, totalElements);
            page.setContent(booksDao.getByPage(page.getPageNumber(), page.getPageSize()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return page;
    }

    public List<Books> search(String keyword) {
        try {
            return booksDao.search(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return List.of();
    }
}
