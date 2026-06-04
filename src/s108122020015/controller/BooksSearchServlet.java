package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookSearchServlet")
public class BooksSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        BooksService booksService = new BooksService();
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.isEmpty()) {
            request.setAttribute("error", "keyword is empty");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }
        List<Books> resultList = booksService.search(keyword);
        if (resultList == null || resultList.isEmpty()) {
            request.setAttribute("error", "No results found for " + keyword);
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("resultList", resultList);
        }
        request.getRequestDispatcher("/search_result.jsp").forward(request, response);
    }
}
