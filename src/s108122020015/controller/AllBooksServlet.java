package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.model.Page;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/all_books")
public class AllBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String pageNumberParam = request.getParameter("pageNumber");
        String pageSizeParam = request.getParameter("pageSize");
        int pageNumber = 1;
        int pageSize = 5;

        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            try {
                pageNumber = Integer.parseInt(pageNumberParam);
            } catch (NumberFormatException e) {
                pageNumber = 1;
            }
        }
        if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
            try {
                pageSize = Integer.parseInt(pageSizeParam);
            } catch (NumberFormatException e) {
                pageSize = 5;
            }
        }

        BooksService booksService = new BooksService();

        Page<Books> page = booksService.getByPage(pageNumber, pageSize);
        request.setAttribute("page", page);

        request.getRequestDispatcher("/all_books.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
