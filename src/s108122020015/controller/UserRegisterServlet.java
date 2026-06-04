package s108122020015.controller;

import s108122020015.model.User;
import s108122020015.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("encryptedPassword");
        String email = request.getParameter("email");

        if (username == null || username.isEmpty() || password == null || password.isEmpty() || email == null || email.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        UserService userService = new UserService();
        User user = new User();
        user.setUsername(username);
        String hashedPassword = hashPassword(password);
        user.setPassword(hashedPassword);
        user.setEmail(email);

        if (userService.register(user)) {
            request.setAttribute("success", "User registered successfully");
            response.sendRedirect(request.getContextPath() + "/success.jsp");
        } else {
            request.setAttribute("error", "error register");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password){
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
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
