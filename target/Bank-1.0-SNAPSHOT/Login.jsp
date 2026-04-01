<%-- 
    Document   : Login
    Created on : 30 Sept 2025, 9:37:27 am
    Author     : padol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - SECUREBANK</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
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

        /* Dots pattern */
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

        /* Digital rain effect */
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

        /* Currency Symbols */
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

        .login-box {
            background: rgba(15, 30, 50, 0.7);
            backdrop-filter: blur(20px);
            padding: 50px 40px;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5), 
                        inset 0 1px 0 rgba(255, 255, 255, 0.1);
            width: 100%;
            max-width: 450px;
            border: 1px solid rgba(52, 152, 219, 0.3);
            position: relative;
            z-index: 10;
            overflow: hidden;
            animation: slideUp 0.8s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(52, 152, 219, 0.2), transparent);
            transition: left 0.7s;
        }

        .login-box:hover::before {
            left: 100%;
        }

        .login-box::after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, #3498db, #2ecc71, #9b59b6, #3498db);
            background-size: 400%;
            border-radius: 24px;
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s;
            animation: gradientRotate 8s linear infinite;
        }

        @keyframes gradientRotate {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .login-box:hover::after {
            opacity: 1;
        }

        .icon-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 2.5rem;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            box-shadow: 0 10px 30px rgba(52, 152, 219, 0.5), 0 0 40px rgba(52, 152, 219, 0.3);
            animation: iconPulse 2s ease-in-out infinite;
        }

        @keyframes iconPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        h2 {
            text-align: center;
            color: #ffffff;
            font-size: 2rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5);
            margin-bottom: 10px;
            animation: glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 30px rgba(52, 152, 219, 0.7), 0 0 60px rgba(52, 152, 219, 0.5); }
            50% { text-shadow: 0 0 40px rgba(52, 152, 219, 0.9), 0 0 80px rgba(52, 152, 219, 0.7); }
        }

        .subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
            margin-bottom: 30px;
        }

        label {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.95rem;
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
            margin-top: 20px;
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 14px 18px;
            border: 1px solid rgba(52, 152, 219, 0.3);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
            font-size: 1rem;
            transition: all 0.3s ease;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #3498db;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2), 0 0 20px rgba(52, 152, 219, 0.3);
        }

        input[type="submit"] {
            width: 100%;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            padding: 16px 32px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 30px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
            box-shadow: 0 8px 20px rgba(52, 152, 219, 0.4);
        }

        input[type="submit"]::before {
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

        input[type="submit"]:hover::before {
            width: 300px;
            height: 300px;
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(52, 152, 219, 0.6), 0 0 40px rgba(52, 152, 219, 0.3);
        }

        input[type="submit"]:active {
            transform: scale(0.95);
        }

        .error {
            color: #e74c3c;
            text-align: center;
            margin-top: 20px;
            font-size: 0.95rem;
            background: rgba(231, 76, 60, 0.1);
            padding: 12px;
            border-radius: 8px;
            border-left: 3px solid #e74c3c;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .login-box {
                padding: 40px 30px;
            }

            h2 {
                font-size: 1.6rem;
            }

            .icon {
                width: 70px;
                height: 70px;
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Grid Background -->
    <div class="grid-background"></div>
    
    <!-- Animated Orbs -->
    <div class="orb orb1"></div>
    <div class="orb orb2"></div>
    <div class="orb orb3"></div>
    
    <!-- Dots Pattern -->
    <div class="dots"></div>
    
    <!-- Digital Rain Effect -->
    <div class="digital-rain" style="left: 15%; animation-delay: 0ms;"></div>
    <div class="digital-rain" style="left: 35%; animation-delay: 2000ms;"></div>
    <div class="digital-rain" style="left: 55%; animation-delay: 4000ms;"></div>
    <div class="digital-rain" style="left: 75%; animation-delay: 1000ms;"></div>
    <div class="digital-rain" style="left: 85%; animation-delay: 3000ms;"></div>
    
    <!-- Currency Symbols -->
    <div class="currency-symbol" style="left: 10%; animation-delay: 0s;">$</div>
    <div class="currency-symbol" style="left: 25%; animation-delay: 5s;">₹</div>
    <div class="currency-symbol" style="left: 45%; animation-delay: 10s;">€</div>
    <div class="currency-symbol" style="left: 65%; animation-delay: 15s;">£</div>
    <div class="currency-symbol" style="left: 85%; animation-delay: 20s;">¥</div>

    <div class="login-box">
        <div class="icon-header">
            <div class="icon">👤</div>
            <h2>CUSTOMER LOGIN</h2>
            <p class="subtitle">Welcome Back to SECUREBANK</p>
        </div>
        
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" placeholder="Enter your username" required>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter your password" required>
            
            <input type="submit" value="Sign In to Account">
        </form>
        
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error">
                ${errorMessage}
            </div>
        <% } %>
    </div>
</body>
</html>