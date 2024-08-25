package pkg1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginManager {

    // Validates login credentials based on email, password, and userType
    public boolean validateLogin(String email, String loginPassword, String userType) {
        boolean result = false;
        String SQL = "SELECT * FROM users WHERE email=? AND login_password=? AND user_type=?";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL)) {

            // Encrypt the provided password
            String encryptedLoginPassword = EncryptionUtil.encryptPassword(loginPassword);

            pstat.setString(1, email);
            pstat.setString(2, encryptedLoginPassword);
            pstat.setString(3, userType);

            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception ex) {
            System.out.println("Error : " + ex.getMessage());
        }
        return result;
    }

    // Saves a new admin user
    public boolean saveStaff(String fullName, String email, String address, String loginName, String loginPassword, String phone) {
        boolean result = false;
        String SQL = "INSERT INTO users (full_name, email, address, login_name, login_password, user_type, phone) VALUES (?, ?, ?, ?, ?, 'staff', ?)";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Encrypt the password
            String encryptedLoginPassword = EncryptionUtil.encryptPassword(loginPassword);

            pstat.setString(1, fullName);
            pstat.setString(2, email);
            pstat.setString(3, address);
            pstat.setString(4, loginName);
            pstat.setString(5, encryptedLoginPassword);
            pstat.setString(6, phone);

            pstat.executeUpdate();

            // Get the generated user ID
            try (ResultSet generatedKeys = pstat.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);

                    // Insert into the staff table
                    String staffSQL = "INSERT INTO staff (user_id, staff_email) VALUES (?, ?)";
                    try (PreparedStatement staffPstat = conn.prepareStatement(staffSQL)) {
                        staffPstat.setInt(1, userId);
                        staffPstat.setString(2, email);
                        staffPstat.executeUpdate();
                    }
                }
            }

            result = true;
        } catch (Exception ex) {
            System.out.println("Error : " + ex.getMessage());
        }
        return result;
    }

    // Saves a new student user with encrypted password
    public boolean saveStudent(String fullName, String email, String loginName, String address, String loginPassword, String mobileNumber, String studentID) {
        boolean result = false;
        String SQL = "INSERT INTO users (full_name, email, login_name, address, login_password, user_type) VALUES (?, ?, ?, ?, ?, 'student')";

        try (Connection conn = new MyDB().connect();
             PreparedStatement pstat = conn.prepareStatement(SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Encrypt the password
            String encryptedLoginPassword = EncryptionUtil.encryptPassword(loginPassword);

            pstat.setString(1, fullName);
            pstat.setString(2, email);
            pstat.setString(3, loginName);
            pstat.setString(4, address);
            pstat.setString(5, encryptedLoginPassword);

            pstat.executeUpdate();

            // Get the generated user ID
            try (ResultSet generatedKeys = pstat.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);

                    // Insert into the students table
                    String studentSQL = "INSERT INTO students (user_id, mobile_number, student_identifier) VALUES (?, ?, ?)";
                    try (PreparedStatement studentPstat = conn.prepareStatement(studentSQL)) {
                        studentPstat.setInt(1, userId);
                        studentPstat.setString(2, mobileNumber);
                        studentPstat.setString(3, studentID);
                        studentPstat.executeUpdate();
                    }
                }
            }

            result = true;
        } catch (Exception ex) {
            System.out.println("Error : " + ex.getMessage());
        }
        return result;
    }
    
    
 // Updates an existing student user
    public boolean updateStudent(int userId, String fullName, String email, String loginName, String address, String loginPassword, String mobileNumber, String studentID) {
        boolean result = false;

        // SQL query to update the user details
        String userSQL = "UPDATE users SET full_name=?, email=?, login_name=?, address=?"
                + (loginPassword != null && !loginPassword.isEmpty() ? ", login_password=?" : "") + " WHERE user_id=?";

        // SQL query to update student-specific details
        String studentSQL = "UPDATE students SET mobile_number=?, student_identifier=? WHERE user_id=?";

        try (Connection conn = new MyDB().connect()) {
            // Update the user table
            try (PreparedStatement userPstat = conn.prepareStatement(userSQL)) {
                userPstat.setString(1, fullName);
                userPstat.setString(2, email);
                userPstat.setString(3, loginName);
                userPstat.setString(4, address);

                int index = 5;
                if (loginPassword != null && !loginPassword.isEmpty()) {
                    // Encrypt the new password if it is provided
                    String encryptedLoginPassword = EncryptionUtil.encryptPassword(loginPassword);
                    userPstat.setString(index++, encryptedLoginPassword);
                }
                userPstat.setInt(index, userId);

                int userUpdateCount = userPstat.executeUpdate();

                // Update the student table
                try (PreparedStatement studentPstat = conn.prepareStatement(studentSQL)) {
                    studentPstat.setString(1, mobileNumber);
                    studentPstat.setString(2, studentID);
                    studentPstat.setInt(3, userId);

                    int studentUpdateCount = studentPstat.executeUpdate();

                    // If both updates were successful
                    result = (userUpdateCount > 0 && studentUpdateCount > 0);
                }
            }
        } catch (Exception ex) {
            System.out.println("Error : " + ex.getMessage());
        }

        return result;
    }

}
