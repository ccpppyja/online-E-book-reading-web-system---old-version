package s108122020015.controller;

import s108122020015.model.Books;
import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/book_edit")
public class BooksEditServlet extends HttpServlet {
    private BooksService booksService = new BooksService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Books books = new Books();

        books.setAuthor(request.getParameter("author"));
        books.setGenre(request.getParameter("genre"));
        books.setDescription(request.getParameter("description"));
        books.setFileUrl(request.getParameter("fileUrl"));
        books.setImageUrl(request.getParameter("imageUrl"));

        if (books.getFileUrl() == null || books.getFileUrl().isEmpty()) {
            request.setAttribute("error", "fileUrl cannot be empty");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            String id = request.getParameter("id");
            String publishDate = request.getParameter("publishDate");
            if (id == null || id.isEmpty()) {
                request.setAttribute("error", "book id cannot be empty");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            books.setId(Integer.parseInt(id));
            books.setPublishDate(sdf.parse(publishDate));
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
        }
        if (!booksService.updateBooks(books)) {
            request.setAttribute("error", "update failed");
        }
        response.sendRedirect(request.getContextPath() + "admin_page.jsp");
    }
}