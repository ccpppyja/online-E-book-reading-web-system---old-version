package s108122020015.controller;

import s108122020015.model.User;
import s108122020015.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reset")
public class UserResetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        System.out.println("user_reset servlet");
        UserService userService = new UserService();
        User user = new User();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            if (username == null || password == null || email == null) {
                request.setAttribute("error", "Missing required parameters");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            user.setUsername(username);
            String hashedPassword = hashPassword(password);
            user.setPassword(hashedPassword);
            user.setEmail(email);
            if (userService.update(user)){
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("error", "reset failed");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid user ID format");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private String hashPassword(String password) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuffer hexString = new StringBuffer();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
