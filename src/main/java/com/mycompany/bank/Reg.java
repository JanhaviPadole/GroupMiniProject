/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.bank;

/**
 *
 * @author padol
 */


public class Reg {
    private int userID;
    private String fullName;
    private String dob;
    private String gender;
    private String maritalStatus;
    private String guardianName;
    private String nationality;
    private String mobile;
    private String email;
    private String permanentAddress;
    private String currentAddress;
    private String aadhaar;
    private String pan;
    private String accountType;
    private double deposit;
    private String nomineeName;
    private String nomineeRelation;
    private String nomineeDob;
    private String username;
    private String password;
    private String securityQuestion;
    private String securityAnswer;
    private String photoPath;
    private String signaturePath;
    private String accountNumber; // ✅ NEW FIELD

    public Reg(String fullName, String dob, String gender, String maritalStatus, String guardianName,
               String nationality, String mobile, String email, String permanentAddress, String currentAddress,
               String aadhaar, String pan, String accountType, double deposit, String nomineeName,
               String nomineeRelation, String nomineeDob, String username, String password,
               String securityQuestion, String securityAnswer, String photoPath, String signaturePath,
               String accountNumber) {
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.maritalStatus = maritalStatus;
        this.guardianName = guardianName;
        this.nationality = nationality;
        this.mobile = mobile;
        this.email = email;
        this.permanentAddress = permanentAddress;
        this.currentAddress = currentAddress;
        this.aadhaar = aadhaar;
        this.pan = pan;
        this.accountType = accountType;
        this.deposit = deposit;
        this.nomineeName = nomineeName;
        this.nomineeRelation = nomineeRelation;
        this.nomineeDob = nomineeDob;
        this.username = username;
        this.password = password;
        this.securityQuestion = securityQuestion;
        this.securityAnswer = securityAnswer;
        this.photoPath = photoPath;
        this.signaturePath = signaturePath;
        this.accountNumber = accountNumber;
    }

    public Reg(int userID, String fullName, String dob, String gender, String maritalStatus, String guardianName,
               String nationality, String mobile, String email, String permanentAddress, String currentAddress,
               String aadhaar, String pan, String accountType, double deposit, String nomineeName,
               String nomineeRelation, String nomineeDob, String username, String password,
               String securityQuestion, String securityAnswer, String photoPath, String signaturePath,
               String accountNumber) {
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.maritalStatus = maritalStatus;
        this.guardianName = guardianName;
        this.nationality = nationality;
        this.mobile = mobile;
        this.email = email;
        this.permanentAddress = permanentAddress;
        this.currentAddress = currentAddress;
        this.aadhaar = aadhaar;
        this.pan = pan;
        this.accountType = accountType;
        this.deposit = deposit;
        this.nomineeName = nomineeName;
        this.nomineeRelation = nomineeRelation;
        this.nomineeDob = nomineeDob;
        this.username = username;
        this.password = password;
        this.securityQuestion = securityQuestion;
        this.securityAnswer = securityAnswer;
        this.photoPath = photoPath;
        this.signaturePath = signaturePath;
        this.accountNumber = accountNumber;
        this.userID = userID;
    }

    // ✅ Getters
    public int getUserID() { return userID; }
    public String getFullName() { return fullName; }
    public String getDob() { return dob; }
    public String getGender() { return gender; }
    public String getMaritalStatus() { return maritalStatus; }
    public String getGuardianName() { return guardianName; }
    public String getNationality() { return nationality; }
    public String getMobile() { return mobile; }
    public String getEmail() { return email; }
    public String getPermanentAddress() { return permanentAddress; }
    public String getCurrentAddress() { return currentAddress; }
    public String getAadhaar() { return aadhaar; }
    public String getPan() { return pan; }
    public String getAccountType() { return accountType; }
    public double getDeposit() { return deposit; }
    public String getNomineeName() { return nomineeName; }
    public String getNomineeRelation() { return nomineeRelation; }
    public String getNomineeDob() { return nomineeDob; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getSecurityQuestion() { return securityQuestion; }
    public String getSecurityAnswer() { return securityAnswer; }
    public String getPhotoPath() { return photoPath; }
    public String getSignaturePath() { return signaturePath; }
    public String getAccountNumber() { return accountNumber; } // ✅ NEW GETTER
}
