package s108122020015.service;

import s108122020015.dao.UserDao;
import s108122020015.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();
    public boolean register(User user) {
        try {
            if (userDao.findByUsername(user.getUsername()) != null || userDao.findByEmail(user.getEmail()) != null) {
                return false;
            }
            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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

    public boolean validatePassword(String plainPassword, String hashedPassword) {
        return hashPassword(plainPassword).equals(hashedPassword);
    }

    public User login(String username, String password) {
        try {
            User user = userDao.findByUsername(username);
            if (user != null && validatePassword(password, user.getPassword())) {
                return user;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User findById(int id) {
        User user = null;
        try {
            user = userDao.findById(id);
        } catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    public boolean update(User user) {
        try {
            if (userDao.update(user) > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        try {
            if (userDao.delete(id) > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> findAll() {
        List<User> users = null;
        try {
            users = userDao.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
