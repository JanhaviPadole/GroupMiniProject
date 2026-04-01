<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@page import="com.mycompany.bank.Reg"%>
<%@page import="com.mycompany.bank.RegDAO"%>
<%
Reg user = (Reg) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Bank Dashboard</title>
    <style>
     *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #0a192f; /* Dark Blue/Black background */
            min-height: 100vh;
            padding: 40px 20px;
            position: relative;
            overflow-x: hidden;
            color: #ffffff;
        }

        .container {
            position: relative;
            z-index: 10;
            max-width: 1400px;
            margin: 0 auto;
        }

      
        .grid-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                linear-gradient(rgba(52, 152, 219, 0.1) 1px, transparent 1px),
                linear-gradient(90deg, rgba(52, 152, 219, 0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: gridMove 20s linear infinite;
            z-index: 0;
        }

        @keyframes gridMove {
            0% { transform: translate(0, 0); }
            100% { transform: translate(50px, 50px); }
        }

       
        .orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.4;
            animation: float 20s ease-in-out infinite;
            z-index: 0;
        }

        .orb1 {
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, #3498db, transparent); /* Blue */
            top: -200px;
            right: -100px;
        }

        .orb2 {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, #2ecc71, transparent); /* Green */
            bottom: -150px;
            left: -100px;
            animation-delay: 5s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(150px, -100px) scale(1.2); }
            66% { transform: translate(-100px, 100px) scale(0.8); }
        }

        .digital-rain {
            position: fixed;
            width: 2px;
            height: 100px;
            background: linear-gradient(transparent, #3498db, transparent);
            animation: rain 8s linear infinite;
            z-index: 0;
        }

        @keyframes rain {
            0% { transform: translateY(-100px); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(100vh); opacity: 0; }
        }
	 .header {
            background-color: transparent;
            padding: 0;
            text-align: center;
            margin-bottom: 40px;
            animation: slideDown 0.8s ease-out;
        }

        .header h1 {
            font-size: 2.8rem;
            color: #ffffff;
            text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5);
            font-weight: 700;
            letter-spacing: 2px;
            animation: glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5); }
            50% { text-shadow: 0 0 40px rgba(52, 152, 219, 0.9), 0 0 80px rgba(52, 152, 219, 0.7); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .nav {
            text-align: center;
            margin-bottom: 40px;
            animation: fadeIn 1s ease-out 0.5s both;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .nav a {
            display: inline-block;
            margin: 0 15px;
            text-decoration: none;
            padding: 16px 30px;
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%); 
            color: white;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 8px 20px rgba(46, 204, 113, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .nav a.logout-link {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%); 
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.4);
        }

        .nav a::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
            z-index: -1;
        }

        .nav a:hover::before {
            width: 200px;
            height: 200px;
        }

        .nav a:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(46, 204, 113, 0.6), 0 0 40px rgba(46, 204, 113, 0.3);
        }
        
        .nav a.logout-link:hover {
            box-shadow: 0 12px 30px rgba(231, 76, 60, 0.6), 0 0 40px rgba(231, 76, 60, 0.3);
        }


        .content {
            padding: 0;
            display: flex;
            justify-content: center;
        }
        
        .info-box {
            background: rgba(15, 30, 50, 0.6);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5),
                        inset 0 1px 0 rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(52, 152, 219, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 700px;
            margin-bottom: 30px;
            animation: slideUp 0.8s ease-out 0.6s both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .info-box h3 {
            color: #3498db; 
            font-size: 1.8rem;
            margin-bottom: 25px;
            text-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            border-bottom: 2px solid rgba(52, 152, 219, 0.3);
            padding-bottom: 10px;
        }
        
        .info-box p {
            margin: 15px 0;
            font-size: 1.1rem;
            color: rgba(255, 255, 255, 0.85);
            border-left: 4px solid #2ecc71;
            padding-left: 15px;
            transition: all 0.3s ease;
        }
        
        .info-box p:hover {
            border-left-color: #3498db;
            color: #ffffff;
            background-color: rgba(52, 152, 219, 0.05);
        }

        .info-box p strong {
            color: #ffffff;
            display: inline-block;
            min-width: 150px;
        }
    </style>
</head>
<body>
    <div class="grid-background"></div>
    
    <div class="orb orb1"></div>
    <div class="orb orb2"></div>
    
    <div class="digital-rain" style="left: 10%; animation-delay: 0ms;"></div>
    <div class="digital-rain" style="left: 30%; animation-delay: 2000ms;"></div>
    <div class="digital-rain" style="left: 50%; animation-delay: 4000ms;"></div>
    <div class="digital-rain" style="left: 70%; animation-delay: 1000ms;"></div>
    <div class="digital-rain" style="left: 90%; animation-delay: 3000ms;"></div>

    <div class="container">
        <div class="header">
            <h1>Welcome to Secure Bank, <%= user.getFullName() %></h1>
        </div>

        <div class="nav">
            <a href="schemes.jsp?type=<%= user.getAccountType() %>">View Schemes</a>
            <a href="index.html" class="logout-link">Logout</a>
        </div>

        <div class="content">
            <div class="info-box">
                <h3>Account Overview</h3>
                <p><strong>User ID:</strong> <%= user.getUserID() %></p>
                <p><strong>Account Number:</strong> <%= user.getAccountNumber() %></p>
                <p><strong>Account Type:</strong> <%= user.getAccountType() %></p>
                <p><strong>Deposit Balance:</strong> ₹<%= user.getDeposit() %></p>
                <p><strong>Email:</strong> <%= user.getEmail() %></p>
                <p><strong>Mobile:</strong> <%= user.getMobile() %></p>
            </div>
        </div>
    </div>
</body>
</html>