package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/book_details")
public class BookDetailsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            request.setAttribute("msg", "Invalid id");
        }
        try {
            int bookId = Integer.parseInt(id);
            BooksService booksService = new BooksService();
            Books book = booksService.getBooksById(bookId);
            if (book != null) {
                request.setAttribute("book", book);
                request.getRequestDispatcher("/book_details.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Book not found");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
}
