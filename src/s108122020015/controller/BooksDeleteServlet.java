package s108122020015.controller;

import s108122020015.service.BooksService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/books_delete")
public class BooksDeleteServlet extends HttpServlet {
    private BooksService booksService = new BooksService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                throw new IllegalArgumentException("Invalid or missing book ID.");
            }
            int id = Integer.parseInt(idParam);
            if (!booksService.deleteBooks(id)) {
                throw new Exception("Failed to delete book. Book ID may not exist");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/books_list" + "?pageNo=" + request.getParameter("pageNo"));
    }
}
