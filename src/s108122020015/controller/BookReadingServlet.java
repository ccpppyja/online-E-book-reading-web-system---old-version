package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/book_reading")
public class BookReadingServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        BooksService booksService = new BooksService();
        String bookId = request.getParameter("bookId");
        if (bookId == null || bookId.isEmpty()) {
            response.getWriter().println("Book id is empty");
            return;
        }
        try {
            int id = Integer.parseInt(bookId);
            Books book = booksService.getBooksById(id);
            if (book != null) {
                request.setAttribute("book", book);
                request.getRequestDispatcher("/reading.jsp").forward(request, response);
            } else {
                response.getWriter().println("Book not found");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
}
