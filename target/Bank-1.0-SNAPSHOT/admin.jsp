<%-- 
    Document   : admin
    Created on : 7 Sept 2025, 11:55:39 am
    Author     : padol
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.bank.Reg" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Users - SECUREBANK</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #0a192f;
            min-height: 100vh;
            padding: 40px 20px;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Grid Background */
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

        /* Animated gradient orbs */
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
            background: radial-gradient(circle, #3498db, transparent);
            top: -200px;
            right: -100px;
        }

        .orb2 {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, #2ecc71, transparent);
            bottom: -150px;
            left: -100px;
            animation-delay: 5s;
        }

        .orb3 {
            width: 350px;
            height: 350px;
            background: radial-gradient(circle, #9b59b6, transparent);
            top: 50%;
            left: 50%;
            animation-delay: 10s;
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(150px, -100px) scale(1.2); }
            66% { transform: translate(-100px, 100px) scale(0.8); }
        }

        .dots {
            position: fixed;
            width: 100%;
            height: 100%;
            background-image: radial-gradient(circle, rgba(52, 152, 219, 0.2) 1px, transparent 1px);
            background-size: 30px 30px;
            animation: dotsMove 30s linear infinite;
            z-index: 0;
        }

        @keyframes dotsMove {
            0% { background-position: 0 0; }
            100% { background-position: 30px 30px; }
        }

        .digital-rain {
            position: fixed;
            width: 2px;
            height: 100px;
            background: linear-gradient(transparent, #3498db, transparent);
            animation: rain 8s linear infinite;
        }

        @keyframes rain {
            0% { transform: translateY(-100px); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(100vh); opacity: 0; }
        }

        .currency-symbol {
            position: fixed;
            font-size: 80px;
            color: rgba(52, 152, 219, 0.1);
            font-weight: bold;
            animation: currencyFloat 25s linear infinite;
            z-index: 0;
        }

        @keyframes currencyFloat {
            0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.3; }
            90% { opacity: 0.3; }
            100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
        }

        .container {
            position: relative;
            z-index: 10;
            max-width: 1400px;
            margin: 0 auto;
        }

        h2 {
            font-size: 2.8rem;
            margin-bottom: 15px;
            color: #ffffff;
            text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5);
            font-weight: 700;
            letter-spacing: 2px;
            animation: slideDown 0.8s ease-out, glow 3s ease-in-out infinite;
            text-align: center;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5); }
            50% { text-shadow: 0 0 40px rgba(52, 152, 219, 0.9), 0 0 80px rgba(52, 152, 219, 0.7); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 1rem;
            margin-bottom: 40px;
            animation: fadeIn 1s ease-out 0.3s both;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .table-wrapper {
            background: rgba(15, 30, 50, 0.6);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5),
                        inset 0 1px 0 rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(52, 152, 219, 0.2);
            overflow: hidden;
            animation: slideUp 0.8s ease-out 0.4s both;
            margin-bottom: 30px;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 18px 15px;
            text-align: left;
            border-bottom: 1px solid rgba(52, 152, 219, 0.2);
        }

        th {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 1px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            position: sticky;
            top: 0;
            z-index: 5;
        }

        /* Table Data styles */
        td {
            color: rgba(255, 255, 255, 0.85);
            font-size: 0.95rem;
            background: rgba(15, 30, 50, 0.4);
        }

        tr:hover td {
            background: rgba(52, 152, 219, 0.15);
            transition: background 0.3s ease;
        }

        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 12px;
            border: 2px solid rgba(52, 152, 219, 0.3);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        img:hover {
            transform: scale(1.5);
            box-shadow: 0 8px 24px rgba(52, 152, 219, 0.5);
            z-index: 100;
            position: relative;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: rgba(255, 255, 255, 0.6);
            font-size: 1.1rem;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 16px 40px;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            text-decoration: none;
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

        .back-link::before {
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

        .back-link:hover::before {
            width: 300px;
            height: 300px;
        }

        .back-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(52, 152, 219, 0.6), 0 0 40px rgba(52, 152, 219, 0.3);
        }

        .back-link:active {
            transform: scale(0.95);
        }

        .link-container {
            text-align: center;
        }

        .filter-form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
            padding: 20px;
            background: rgba(15, 30, 50, 0.6);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-out 0.4s both;
            border: 1px solid rgba(52, 152, 219, 0.2);
        }

        .filter-form label {
            color: #ffffff;
            font-weight: 600;
            font-size: 1rem;
        }

        .filter-form select, .filter-form input[type="submit"] {
            padding: 10px 15px;
            border-radius: 8px;
            border: 1px solid #3498db;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .filter-form select {
            background: rgba(52, 152, 219, 0.1);
            color: white;
            appearance: none;
            min-width: 150px;
        }

        .filter-form select:focus {
            border-color: #2ecc71;
            box-shadow: 0 0 10px rgba(46, 204, 113, 0.5);
            outline: none;
        }

        .filter-form input[type="submit"] {
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: white;
            cursor: pointer;
            font-weight: 700;
            border: none;
            box-shadow: 0 4px 10px rgba(46, 204, 113, 0.3);
        }

        .filter-form input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(46, 204, 113, 0.5);
        }
        
        @media (max-width: 1200px) {
            .table-wrapper {
                overflow-x: auto;
            }
            
            table {
                min-width: 1000px;
            }
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }

            .subtitle {
                font-size: 0.9rem;
            }

            th, td {
                padding: 12px 10px;
                font-size: 0.85rem;
            }

            img {
                width: 60px;
                height: 60px;
            }
            
            .filter-form {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>
</head>
<body>
    <div class="grid-background"></div>
    <div class="orb orb1"></div>
    <div class="orb orb2"></div>
    <div class="orb orb3"></div>
    <div class="dots"></div>
    <div class="digital-rain" style="left: 15%; animation-delay: 0ms;"></div>
    <div class="digital-rain" style="left: 35%; animation-delay: 2000ms;"></div>
    <div class="digital-rain" style="left: 55%; animation-delay: 4000ms;"></div>
    <div class="digital-rain" style="left: 75%; animation-delay: 1000ms;"></div>
    <div class="digital-rain" style="left: 85%; animation-delay: 3000ms;"></div>
    <div class="currency-symbol" style="left: 10%; animation-delay: 0s;">$</div>
    <div class="currency-symbol" style="left: 25%; animation-delay: 5s;">₹</div>
    <div class="currency-symbol" style="left: 45%; animation-delay: 10s;">€</div>
    <div class="currency-symbol" style="left: 65%; animation-delay: 15s;">£</div>
    <div class="currency-symbol" style="left: 85%; animation-delay: 20s;">¥</div>

    <div class="container">
        <h2>BANK REGISTRATIONS</h2>
        <p class="subtitle">Registered User Accounts Dashboard with Filter</p>

        
        <div class="table-wrapper">
            <table>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Account Type</th>
                    <th>Deposit</th>
                    <th>Photo</th>
                    <th>Signature</th>
                </tr>

                <%
                    List<Reg> regList = (List<Reg>) request.getAttribute("regList");
                    if (regList != null && !regList.isEmpty()) {
                        for (Reg reg : regList) {
                            // Logic for safe path extraction (from Code 1 - better error handling)
                            String photoPath = reg.getPhotoPath();
                            String signaturePath = reg.getSignaturePath();
                            
                            String photoFile = (photoPath != null && photoPath.contains(File.separator)) ?
                                photoPath.substring(photoPath.lastIndexOf(File.separator) + 1) : "default_photo.jpg";
                            String signatureFile = (signaturePath != null && signaturePath.contains(File.separator)) ?
                                signaturePath.substring(signaturePath.lastIndexOf(File.separator) + 1) : "default_signature.jpg";
                %>
                <tr>
                    <td><%= reg.getUserID() %></td>
                    <td><%= reg.getFullName() %></td>
                    <td><%= reg.getEmail() %></td>
                    <td><%= reg.getMobile() %></td>
                    <td><%= reg.getAccountType() %></td>
                    <td><%= reg.getDeposit() %></td>
                    <td>
                        <img src="<%= request.getContextPath() + "/uploads/" + photoFile %>" alt="Photo" onerror="this.src='default_photo.jpg';">
                    </td>
                    <td>
                        <img src="<%= request.getContextPath() + "/uploads/" + signatureFile %>" alt="Signature" onerror="this.src='default_signature.jpg';">
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8" class="no-data">No registered users found.</td>
                </tr>
                <% } %>
            </table>
        </div>
        
        <div class="link-container">
            <a href="index.html" class="back-link">← Return to Home</a>
        </div>
    </div>
</body>
</html>