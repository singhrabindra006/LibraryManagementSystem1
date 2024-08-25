package pkg1;

public class Student {
    private int userId;
    private String fullName;
    private String email;
    private String loginName;
    private String address;
    private String loginPassword;
    private String mobileNumber;
    private String studentID;

    // Default constructor
    public Student() {
    }

    // Parameterized constructor
    public Student(int userId, String fullName, String email, String loginName, 
                   String address, String loginPassword, String mobileNumber, String studentID) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.loginName = loginName;
        this.address = address;
        this.loginPassword = loginPassword;
        this.mobileNumber = mobileNumber;
        this.studentID = studentID;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    @Override
    public String toString() {
        return "Student [userId=" + userId + ", fullName=" + fullName + ", email=" + email + 
               ", loginName=" + loginName + ", address=" + address + ", loginPassword=" + loginPassword + 
               ", mobileNumber=" + mobileNumber + ", studentID=" + studentID + "]";
    }
}
