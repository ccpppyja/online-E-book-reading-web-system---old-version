package s108122020015.controller;

import s108122020015.model.Bookmarks;
import s108122020015.model.User;
import s108122020015.service.BookmarksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add_bookmarks")
public class BookmarksAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        BookmarksService bookmarksService = new BookmarksService();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("error", "user not logged in");
            return;
        }
        int userId = user.getId();
        String bookIdParam = request.getParameter("bookId");
        if (bookIdParam == null || bookIdParam.isEmpty()) {
            request.setAttribute("error", "bookId is null");
            return;
        }
        Bookmarks bookmarks = new Bookmarks();
        try {
            int bookId = Integer.parseInt(bookIdParam);
            if (bookmarksService.findByBookId(bookId) != null) {
                request.setAttribute("error", "bookmark already exist");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            bookmarks.setUserId(userId);
            bookmarks.setBookId(bookId);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (bookmarksService.addBookmarks(bookmarks)) {
            request.setAttribute("success", "Adding Success!");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Adding Failed");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }

}
