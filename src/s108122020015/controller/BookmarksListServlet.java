package s108122020015.controller;

import s108122020015.model.Bookmarks;
import s108122020015.service.BookmarksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/list_bookmarks")
public class BookmarksListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        BookmarksService bookmarksService = new BookmarksService();
        String userIdParam = request.getParameter("userId");
        if (userIdParam == null || userIdParam.isEmpty()) {
            request.setAttribute("message", "Invalid user id");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        try {
            int userId = Integer.parseInt(userIdParam);
            List<Bookmarks> bookmarks = bookmarksService.findByUser(userId);
            if (!bookmarks.isEmpty()) {
                request.setAttribute("bookmarks", bookmarks);
                request.getRequestDispatcher("bookmarks_list.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
