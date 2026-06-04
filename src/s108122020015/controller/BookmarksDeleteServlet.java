package s108122020015.controller;

import s108122020015.service.BookmarksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete_bookmarks")
public class BookmarksDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        BookmarksService bookmarksService = new BookmarksService();
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            throw new IllegalArgumentException("id is null or empty");
        }
        int id = Integer.parseInt(idParam);
        if (bookmarksService.deleteBookmarks(id)) {
            request.setAttribute("result", "success");
            request.getRequestDispatcher("bookmarks_list.jsp").forward(request, response);
        } else {
            request.setAttribute("result", "fail");
        }
    }
}
