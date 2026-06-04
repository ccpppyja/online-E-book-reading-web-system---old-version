package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/book_edit_show")
public class BookEditShowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        BooksService booksService = new BooksService();
        int bookId = Integer.parseInt(request.getParameter("id"));
        Books book = booksService.getBooksById(bookId);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/book_edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
    }
}
