/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author padol
 */
public class RegDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/banking";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
public int insertReg(String fullName, String dob, String gender, String maritalStatus, String guardianName,
                     String nationality, String mobile, String email, String permanentAddress, String currentAddress,
                     String aadhaar, String pan, String accountType, double deposit, String nomineeName,
                     String nomineeRelation, String nomineeDob, String username, String password,
                     String securityQuestion, String securityAnswer, String photoPath, String signaturePath) {

    int userID = -1;
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String accountNumber = "ACCT" + System.currentTimeMillis(); // Generate account number

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        con.setAutoCommit(false); // Begin transaction

        String query = "INSERT INTO account (fullName,dob,gender,marital_status,guardian_name,nationality,mobile,email,permanent_address,current_address,aadhaar,pan,account_type,deposit,nominee_name,nominee_relation,nominee_dob,username,password,security_question,security_answer,photoPath,signaturePath,account_number) "
                     + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, fullName);
        ps.setString(2, dob);
        ps.setString(3, gender);
        ps.setString(4, maritalStatus);
        ps.setString(5, guardianName);
        ps.setString(6, nationality);
        ps.setString(7, mobile);
        ps.setString(8, email);
        ps.setString(9, permanentAddress);
        ps.setString(10, currentAddress);
        ps.setString(11, aadhaar);
        ps.setString(12, pan);
        ps.setString(13, accountType);
        ps.setDouble(14, deposit);
        ps.setString(15, nomineeName);
        ps.setString(16, nomineeRelation);
        ps.setString(17, nomineeDob);
        ps.setString(18, username);
        ps.setString(19, password);
        ps.setString(20, securityQuestion);
        ps.setString(21, securityAnswer);
        ps.setString(22, photoPath);
        ps.setString(23, signaturePath);
        ps.setString(24, accountNumber);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                userID = rs.getInt(1);

                // Insert into respective account type table
                PreparedStatement typePs = null;
                switch (accountType.toLowerCase()) {
                    case "saving":
                        typePs = con.prepareStatement("INSERT INTO saving (userID, fullName, deposit, account_number) VALUES (?, ?, ?, ?)");
                        typePs.setInt(1, userID);
                        typePs.setString(2, fullName);
                        typePs.setDouble(3, deposit);
                        typePs.setString(4, accountNumber);
                        break;

                    case "salary":
                        typePs = con.prepareStatement("INSERT INTO salary (userID, account_number, salary_amount) VALUES (?, ?, ?)");
                        typePs.setInt(1, userID);
                        typePs.setString(2, accountNumber);
                        typePs.setDouble(3, deposit);
                        break;

                    case "current":
                        typePs = con.prepareStatement("INSERT INTO current (userID, fullName, account_number, account_type, deposit) VALUES (?, ?, ?, ?, ?)");
                        typePs.setInt(1, userID);
                        typePs.setString(2, fullName);
                        typePs.setString(3, accountNumber);
                        typePs.setString(4, accountType);
                        typePs.setDouble(5, deposit);
                        break;
                }

                if (typePs != null) {
                    typePs.executeUpdate();
                    typePs.close();
                }
            }
        }

        con.commit(); // Commit transaction

    } catch (Exception e) {
        e.printStackTrace();
        try {
            if (con != null) con.rollback(); // Rollback on error
        } catch (Exception rollbackEx) {
            rollbackEx.printStackTrace();
        }
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return userID;
}

    public static List<Reg> getAllReg() {
    List<Reg> regList = new ArrayList<>();
    String sql = "SELECT * FROM account";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Reg user = new Reg(
                    rs.getInt("userID"),
                    rs.getString("fullName"),
                    rs.getString("dob"),
                    rs.getString("gender"),
                    rs.getString("marital_status"),
                    rs.getString("guardian_name"),
                    rs.getString("nationality"),
                    rs.getString("mobile"),
                    rs.getString("email"),
                    rs.getString("permanent_address"),
                    rs.getString("current_address"),
                    rs.getString("aadhaar"),
                    rs.getString("pan"),
                    rs.getString("account_type"),
                    rs.getDouble("deposit"),
                    rs.getString("nominee_name"),
                    rs.getString("nominee_relation"),
                    rs.getString("nominee_dob"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("security_question"),
                    rs.getString("security_answer"),
                    rs.getString("photoPath"),
                    rs.getString("signaturePath"),
                    rs.getString("account_number") // ✅ Include this field
                );
                regList.add(user);
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // You can log this instead for production
    }

    return regList;
}
    public List<Reg> getRegByAccountType(String type) {
    List<Reg> list = new ArrayList<>();
    try {
        Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM account WHERE account_type = ?");
        ps.setString(1, type);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
             Reg reg = new Reg(
                rs.getInt("userID"),
                rs.getString("fullName"),
                rs.getString("dob"),
                rs.getString("gender"),
                rs.getString("marital_status"),
                rs.getString("guardian_name"),
                rs.getString("nationality"),
                rs.getString("mobile"),
                rs.getString("email"),
                rs.getString("permanent_address"),
                rs.getString("current_address"),
                rs.getString("aadhaar"),
                rs.getString("pan"),
                rs.getString("account_type"),
                rs.getDouble("deposit"),
                rs.getString("nominee_name"),
                rs.getString("nominee_relation"),
                rs.getString("nominee_dob"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("security_question"),
                rs.getString("security_answer"),
                rs.getString("photoPath"),
                rs.getString("signaturePath"),
                rs.getString("account_number") // ✅ Include new field
            );

            list.add(reg);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
    public Reg getUserById(int userID) {
    Reg user = null;
    String sql = "SELECT * FROM account WHERE userID = ?";

    try (Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, userID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new Reg(
                rs.getInt("userID"),
                rs.getString("fullName"),
                rs.getString("dob"),
                rs.getString("gender"),
                rs.getString("marital_status"),
                rs.getString("guardian_name"),
                rs.getString("nationality"),
                rs.getString("mobile"),
                rs.getString("email"),
                rs.getString("permanent_address"),
                rs.getString("current_address"),
                rs.getString("aadhaar"),
                rs.getString("pan"),
                rs.getString("account_type"),
                rs.getDouble("deposit"),
                rs.getString("nominee_name"),
                rs.getString("nominee_relation"),
                rs.getString("nominee_dob"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("security_question"),
                rs.getString("security_answer"),
                rs.getString("photoPath"),
                rs.getString("signaturePath"),
                rs.getString("account_number")
            );
        }

        rs.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return user;
}
public Reg validateLogin(String username, String password) {
    Reg user = null;
    String sql = "SELECT * FROM account WHERE username = ? AND password = ?";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("Login successful for user: " + username);
                    user = new Reg(
                        rs.getInt("userID"),
                        rs.getString("fullName"),
                        rs.getString("dob"),
                        rs.getString("gender"),
                        rs.getString("marital_status"),
                        rs.getString("guardian_name"),
                        rs.getString("nationality"),
                        rs.getString("mobile"),
                        rs.getString("email"),
                        rs.getString("permanent_address"),
                        rs.getString("current_address"),
                        rs.getString("aadhaar"),
                        rs.getString("pan"),
                        rs.getString("account_type"),
                        rs.getDouble("deposit"),
                        rs.getString("nominee_name"),
                        rs.getString("nominee_relation"),
                        rs.getString("nominee_dob"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("security_question"),
                        rs.getString("security_answer"),
                        rs.getString("photoPath"),
                        rs.getString("signaturePath"),
                        rs.getString("account_number")
                    );
                } else {
                    System.out.println("No user found with username: " + username);
                }
            }
        }
    } catch (Exception e) {
        System.out.println("Error in validateLogin: " + e.getMessage());
        e.printStackTrace();
    }

    return user;
}

}
