/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.bank;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author padol
 */
@WebServlet(name = "submitAccountServlet", urlPatterns = {"/submitAccountServlet"})
@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class submitAccountServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

    String fullName = request.getParameter("fullName");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String maritalStatus = request.getParameter("maritalStatus");
    String guardianName = request.getParameter("guardianName");
    String nationality = request.getParameter("nationality");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String permanentAddress = request.getParameter("permanentAddress");
    String currentAddress = request.getParameter("currentAddress");
    String aadhaar = request.getParameter("aadhaar");
    String pan = request.getParameter("pan");
    String accountType = request.getParameter("accountType");
    double deposit = Double.parseDouble(request.getParameter("deposit"));
    String nomineeName = request.getParameter("nomineeName");
    String nomineeRelation = request.getParameter("nomineeRelation");
    String nomineeDob = request.getParameter("nomineeDob");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String securityQuestion = request.getParameter("securityQuestion");
    String securityAnswer = request.getParameter("securityAnswer");
    
    Part photoPart = request.getPart("photo");
    String photoFileName = Paths.get(photoPart.getSubmittedFileName()).getFileName().toString();
    String photoPath = uploadPath + File.separator + photoFileName;
    photoPart.write(photoPath);
    
    Part signaturePart = request.getPart("signature");
    String signatureFileName = Paths.get(signaturePart.getSubmittedFileName()).getFileName().toString();
    String signaturePath = uploadPath + File.separator + signatureFileName;
    signaturePart.write(signaturePath);
      

    RegDAO dao = new RegDAO();
    try {
    int userID = dao.insertReg(fullName, dob, gender, maritalStatus, guardianName,
                    nationality, mobile, email, permanentAddress, currentAddress,
                    aadhaar, pan, accountType, deposit, nomineeName,
                    nomineeRelation, nomineeDob, username, password,
                    securityQuestion, securityAnswer, photoPath, signaturePath);
        if (userID > 0) {
            response.sendRedirect("success.html");
        } else {
            response.sendRedirect("error.html");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.html");
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
