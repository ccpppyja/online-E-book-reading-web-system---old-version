package s108122020015.controller;

import s108122020015.model.User;
import s108122020015.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        UserService userService = new UserService();
        String username = request.getParameter("username");
        String password = request.getParameter("encryptedPassword");
        User user = null;
        user = userService.login(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("userId", user.getId());
            if ("admin".equals(user.getUsername())) {
                response.sendRedirect(request.getContextPath() + "/admin_page.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/my_space.jsp");
            }
        } else {
            request.setAttribute("error", "wrong username or password");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
