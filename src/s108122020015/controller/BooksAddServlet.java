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
import java.util.Date;

@WebServlet("/add_book")
public class BooksAddServlet extends HttpServlet {
        private BooksService booksService = new BooksService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Books books = new Books();
        request.setCharacterEncoding("UTF-8");

        books.setTitle(request.getParameter("title"));
        books.setAuthor(request.getParameter("author"));
        books.setGenre(request.getParameter("genre"));
        books.setDescription(request.getParameter("description"));
        books.setFileUrl(request.getParameter("fileUrl"));
        books.setImageUrl(request.getParameter("imageUrl"));

        if (books.getTitle() == null || books.getTitle().isEmpty() || books.getFileUrl() == null || books.getFileUrl().isEmpty()) {
            request.setAttribute("error", "title or file Url empty");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try{
            String publishDate = request.getParameter("publishDate");
            if (publishDate == null || publishDate.isEmpty()) {
                books.setPublishDate(null);
            } else {
                String regex = "^\\d{4}-\\d{2}-\\d{2}$";  // Check for yyyy-MM-dd format
                if (!publishDate.matches(regex)) {
                    request.setAttribute("failMsg", "Invalid publish date format. Please use yyyy-MM-dd.");
                    request.getRequestDispatcher("/add_book.jsp").forward(request, response);
                    return;
                }
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                books.setPublishDate(sdf.parse(publishDate));
            }
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
        }
        if (booksService.addBooks(books))
        {
            response.sendRedirect(request.getContextPath() + "/admin_page.jsp");
        } else {
            response.sendRedirect("error");
        }
    }
}
