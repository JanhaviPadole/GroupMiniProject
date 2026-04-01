<%-- 
    Document   : schemes
    Created on : 1 Oct 2025, 2:18:18 pm
    Author     : padol
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accountType = request.getParameter("type");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Schemes - SECUREBANK</title>
    <style>
               * {
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
            text-align: center; /* Center everything in the body */
        }

        .container {
            position: relative;
            z-index: 10;
            max-width: 1000px;
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

        /* Digital rain effect */
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

        /* ========================================================================= */
        /* CONTENT STYLES */
        /* ========================================================================= */
        h2 {
            font-size: 2.5rem;
            margin-bottom: 40px;
            color: #ffffff;
            text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5);
            font-weight: 700;
            letter-spacing: 2px;
            animation: slideDown 0.8s ease-out, glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5); }
            50% { text-shadow: 0 0 40px rgba(52, 152, 219, 0.9), 0 0 80px rgba(52, 152, 219, 0.7); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        ul {
            background: rgba(15, 30, 50, 0.6); /* Darker transparent background */
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5),
                        inset 0 1px 0 rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(52, 152, 219, 0.2);
            padding: 40px;
            width: 90%;
            max-width: 600px;
            margin: 20px auto 40px auto;
            list-style: none; /* Remove default bullets */
            text-align: left;
            animation: slideUp 0.8s ease-out 0.4s both;
        }
        
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        li {
            margin-bottom: 20px;
            padding: 15px;
            background: rgba(52, 152, 219, 0.1); /* Light blue highlight */
            border-radius: 10px;
            border-left: 5px solid #2ecc71; /* Green accent */
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }
        
        li:hover {
            background: rgba(52, 152, 219, 0.2);
            border-left-color: #3498db; /* Blue accent on hover */
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .back {
            text-align: center;
        }

        /* Back Link/Button style */
        .back a {
            display: inline-block;
            text-decoration: none;
            padding: 16px 40px;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 8px 20px rgba(52, 152, 219, 0.4);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
            animation: fadeIn 1s ease-out 0.6s both;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .back a::before {
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

        .back a:hover::before {
            width: 300px;
            height: 300px;
        }

        .back a:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(52, 152, 219, 0.6), 0 0 40px rgba(52, 152, 219, 0.3);
        }

        .back a:active {
            transform: scale(0.95);
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
        <h2>Available Schemes for **<%= accountType.toUpperCase() %>** Account</h2>

        <ul>
        <%
        if (accountType != null) {
            accountType = accountType.toLowerCase();
            if ("salary".equals(accountType)) {
        %>
            <li>**Early Salary Access** (up to 30% of salary advance)</li>
            <li>**Zero Processing Fee** on Personal Loans</li>
           
        <%
            } else if ("savings".equals(accountType)) {
        %>
            <li>**Bonus Interest** after 30 days of no withdrawal</li>
            <li>**Free ATM Withdrawals** up to 5 times/month</li>
            <li>**Auto Sweep Facility** for idle balance into Fixed Deposit</li>
        <%
            } else if ("current".equals(accountType)) {
        %>
            <li>**Overdraft Facility** up to ₹50,000 (subject to approval)</li>
            <li>**Business Loan Eligibility Check** and priority processing</li>
            <li>**Free Cheque Book** and **RTGS Transfers** (unlimited)</li>
        <%
            } else {
        %>
            <li>No specific schemes available for this account type.</li>
        <%
            }
        } else {
        %>
            <li>Account type not specified. Cannot retrieve schemes.</li>
        <%
        }
        %>
        </ul>

        <div class="back">
            <a href="index.html" class="back-link">← Return to Home</a>
        </div>
    </div>
</body>
</html>
