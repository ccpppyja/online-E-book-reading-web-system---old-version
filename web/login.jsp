<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
<script>
    // 提交表单前对密码进行加密
    function encryptPassword(){
        const passWordField = document.getElementById("password");
        const encryptedPasswordField = document.getElementById("encryptedPassword");

        // 获取用户输入的明文密码
        const plainPassword = passWordField.value;

        // 使用 CryptoJS 进行 SHA-256 加密
        const encryptedPassword = CryptoJS.SHA256(plainPassword).toString();

        // 将加密后的密码放入隐藏字段中
        encryptedPasswordField.value = encryptedPassword;

        // 清空明文密码，防止明文密码被提交
        passWordField.value = "";
    }
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form");
        form.onsubmit = encryptPassword;
    });
</script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 100%;
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h3 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .input {
            margin-bottom: 15px;
        }

        .input span {
            display: block;
            font-size: 0.9em;
            color: #555;
            margin-bottom: 5px;
        }

        .input input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
            box-sizing: border-box;
        }

        .input input:focus {
            border-color: #007bff;
            outline: none;
        }

        .alert {
            color: #fff;
            background-color: #f44336;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            text-align: center;
        }

        .register-but {
            text-align: center;
        }

        .register-but input {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .register-but input:hover {
            background-color: #0056b3;
        }

    </style>

</head>
<body>

<div class="account">
    <div class="container">
        <div class="register">
            <c:if test="${!empty failMsg}">
                <div class="alert alert-danger">${failMsg}</div>
            </c:if>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="register-top-grid">
                    <h3>login</h3>
                    <div class="input">
                        <span>username <label style="color: red;">*</label> </span>
                        <input type="text" name="username" id="username" placeholder="input your username" required="required">
                    </div>
                    <div class="input">
                        <span>password <label style="color: red">*</label> </span>
                        <input type="password" name="password" id="password" placeholder="input your password" required="required">
                    </div>
                    <!-- 隐藏字段，用于存储加密后的密码 -->
                    <input type="hidden" name="encryptedPassword" id="encryptedPassword">
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="login">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
