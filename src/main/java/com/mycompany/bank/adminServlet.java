package com.mycompany.bank;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "adminServlet", urlPatterns = {"/adminServlet"})
public class adminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
String password = request.getParameter("password");
String accountType = request.getParameter("accountType");

HttpSession session = request.getSession();
boolean isAuthenticated = name != null && password != null &&
                          name.equalsIgnoreCase("PGJIS") &&
                          password.equals("PgJiS123");

boolean isSessionValid = session.getAttribute("name") != null;

if (isAuthenticated) {
    session.setAttribute("name", name); // ✅ Store login
}

if (isAuthenticated || isSessionValid) {
    RegDAO dao = new RegDAO();
    List<Reg> regList;

    if (accountType != null && !accountType.trim().isEmpty()) {
        regList = dao.getRegByAccountType(accountType);
    } else {
        regList = dao.getAllReg();
    }

    request.setAttribute("regList", regList);
    request.getRequestDispatcher("admin.jsp").forward(request, response);
} else {
    request.getRequestDispatcher("Invalid.jsp").forward(request, response);
}
    

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin login servlet";
    }
}