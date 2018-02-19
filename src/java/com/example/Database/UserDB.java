
package com.example.Database;

import com.transport.Authentication;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.transport.Authentication;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author JQHN
 */
public class UserDB extends Database {

    Authentication authen = new Authentication();
    User users = new User();
    public int login(User u) throws NoSuchAlgorithmException, InvalidKeySpecException, SQLException {
        int result = 0;

        String sql = "SELECT * FROM users WHERE email = ? ";
        this.createStatement(sql);
        stmt.setString(1, u.getEmail());

        rs = stmt.executeQuery();
        int count = 0;
        String storedpassword = null; 
        while (rs.next()) { // we obtain the stored hashed password from the database.
            storedpassword = rs.getString("password");
            ++count;
        }
   
        if (count == 1) {
            // if we find a password with the said email adrress then validate it by comparing using the validate() method.
            if (authen.validatePassword(u.getPassword(), storedpassword)) {
                result = 1;
            }
        }
        return result;
    }

    public int register(User user) throws SQLException, NoSuchAlgorithmException, InvalidKeySpecException {
        String hashedPass = authen.hash(user.getPassword());

        String sql = "INSERT INTO users (user_name, password, user_type, email, contact) VALUES(?, ?, ?, ?,?)";
        this.createStatement(sql);
        stmt.setString(1, user.getUsername());
        stmt.setString(2, hashedPass);
        stmt.setInt(3, 0);
        stmt.setString(4, user.getEmail());
        stmt.setString(5, user.getContact());

        int i = stmt.executeUpdate();

        return i;
    }
    
    public void deleteUser (HttpServletRequest request, HttpServletResponse response, String id) throws IOException, SQLException {
        this.connect();
        this.createStatement("UPDATE users SET deleted=" + 1 + " where user_id=" + id);

        try {
            // execute delete SQL stetement
            stmt.executeUpdate();

            String text = "User successfully deleted";

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(200);
            response.getWriter().write(text);

        } catch (SQLException e) {
            String text = "Failed to delete user at the moment: " + e.getMessage();

            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(403);
            response.getWriter().write(text);

        } finally {

            if (stmt != null) {
                //stmt.close();
            }

            if (conn != null) {
                //conn.close();
            }

        }
    }
    
    public void changeAvailability (HttpServletRequest request, HttpServletResponse response, String id) {
        
    }
}
