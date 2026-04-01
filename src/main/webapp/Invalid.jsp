<%-- 
    Document   : Invalid
    Created on : 16 Sept 2025, 3:20:45 pm
    Author     : padol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invalid Credentials - SECUREBANK</title>
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
            background: radial-gradient(circle, #e74c3c, transparent);
            top: -200px;
            right: -100px;
        }

        .orb2 {
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, #c0392b, transparent);
            bottom: -150px;
            left: -100px;
            animation-delay: 5s;
        }

        .orb3 {
            width: 350px;
            height: 350px;
            background: radial-gradient(circle, #e67e22, transparent);
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
            background-image: radial-gradient(circle, rgba(231, 76, 60, 0.2) 1px, transparent 1px);
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
            background: linear-gradient(transparent, #e74c3c, transparent);
            animation: rain 8s linear infinite;
        }

        @keyframes rain {
            0% { transform: translateY(-100px); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(100vh); opacity: 0; }
        }

        /* Warning symbols */
        .warning-symbol {
            position: fixed;
            font-size: 60px;
            color: rgba(231, 76, 60, 0.1);
            font-weight: bold;
            animation: warningFloat 20s linear infinite;
            z-index: 0;
        }

        @keyframes warningFloat {
            0% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.3; }
            90% { opacity: 0.3; }
            100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
        }

        .message-box {
            background: rgba(192, 57, 43, 0.8);
            backdrop-filter: blur(20px);
            padding: 50px 40px;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5), 
                        inset 0 1px 0 rgba(255, 255, 255, 0.1);
            max-width: 600px;
            width: 100%;
            border: 1px solid rgba(231, 76, 60, 0.4);
            position: relative;
            z-index: 10;
            text-align: center;
            overflow: hidden;
            animation: shake 0.6s ease-out, slideUp 0.8s ease-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-10px); }
            20%, 40%, 60%, 80% { transform: translateX(10px); }
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.7s;
        }

        .message-box:hover::before {
            left: 100%;
        }

        .icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 3rem;
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            box-shadow: 0 10px 30px rgba(231, 76, 60, 0.5), 0 0 40px rgba(231, 76, 60, 0.3);
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); box-shadow: 0 10px 30px rgba(231, 76, 60, 0.5), 0 0 40px rgba(231, 76, 60, 0.3); }
            50% { transform: scale(1.1); box-shadow: 0 15px 40px rgba(231, 76, 60, 0.7), 0 0 60px rgba(231, 76, 60, 0.5); }
        }

        h1 {
            color: #ffffff;
            font-size: 2.2rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-shadow: 0 0 30px rgba(255, 255, 255, 0.5), 0 0 60px rgba(255, 255, 255, 0.3);
            margin-bottom: 20px;
            animation: glow 3s ease-in-out infinite;
        }

        @keyframes glow {
            0%, 100% { text-shadow: 0 0 30px rgba(255, 255, 255, 0.5), 0 0 60px rgba(255, 255, 255, 0.3); }
            50% { text-shadow: 0 0 40px rgba(255, 255, 255, 0.7), 0 0 80px rgba(255, 255, 255, 0.5); }
        }

        p {
            color: rgba(255, 255, 255, 0.95);
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .error-details {
            background: rgba(0, 0, 0, 0.3);
            padding: 15px;
            border-radius: 12px;
            margin: 25px 0;
            border-left: 4px solid #fff;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 16px 40px;
            background: linear-gradient(135deg, #ffffff 0%, #ecf0f1 100%);
            color: #c0392b;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 8px 20px rgba(255, 255, 255, 0.3);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        a::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(192, 57, 43, 0.2);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
            z-index: -1;
        }

        a:hover::before {
            width: 300px;
            height: 300px;
        }

        a:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 30px rgba(255, 255, 255, 0.4);
            color: #c0392b;
        }

        a:active {
            transform: scale(0.95);
        }

        @media (max-width: 768px) {
            .message-box {
                padding: 40px 30px;
            }

            h1 {
                font-size: 1.8rem;
            }

            p {
                font-size: 1rem;
            }

            .icon {
                width: 80px;
                height: 80px;
                font-size: 2.5rem;
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
    
    <!-- Warning Symbols -->
    <div class="warning-symbol" style="left: 10%; animation-delay: 0s;">⚠</div>
    <div class="warning-symbol" style="left: 30%; animation-delay: 5s;">❌</div>
    <div class="warning-symbol" style="left: 50%; animation-delay: 10s;">⚠</div>
    <div class="warning-symbol" style="left: 70%; animation-delay: 15s;">❌</div>
    <div class="warning-symbol" style="left: 90%; animation-delay: 20s;">⚠</div>

    <div class="message-box">
        <div class="icon">❌</div>
        <h1>Invalid Credentials</h1>
        
        <div class="error-details">
            <p>Oops! Something went wrong while connecting.</p>
        </div>
        
        <p>Please check that your username and password are entered correctly.</p>
        
        <a href="AdminLogin.jsp">← Try Again</a>
    </div>
</body>
</html>