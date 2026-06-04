package s108122020015.controller;

import s108122020015.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user_delete")
public class UserDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        UserService userService = new UserService();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            if (userService.delete(id)) {
                response.sendRedirect("/home.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

}
