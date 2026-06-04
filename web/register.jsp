<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
  <script>
    function encryptPassword(){
      event.preventDefault();

      // 获取用户输入的明文密码
      const passwordField = document.getElementById("password");
      const rePasswordField = document.getElementById("re-password")
      const encryptedPasswordField = document.getElementById("encryptedPassword");

      const plainPassword = passwordField.value;
      // 使用 CryptoJS 进行 SHA-256 加密
      const encryptedPassword = CryptoJS.SHA256(plainPassword).toString();
      // 将加密后的密码放入隐藏字段中
      encryptedPasswordField.value = encryptedPassword;
      // 清空明文密码，防止明文密码被提交
      passwordField.value = "";
      rePasswordField.value = "";
      event.target.submit();
    }

    function checkPasswordStrength(password){
      const strengthIndicator = document.getElementById("strengthIndicator");
      const strengthMessage = document.getElementById("strengthMessage");
      let strength = 0;

      if (password.length >= 8) strength++;
      if (/[A-Z]/.test(password)) strength++;
      if (/[a-z]/.test(password)) strength++;
      if (/[0-9]/.test(password)) strength++;
      if (/[!@#$%^&*()>.,-=+`~;':"]/.test(password)) strength++;

      if (strength < 3){
        strengthIndicator.style.color = "red";
        strengthMessage.textContent = "Weak Password";
      } else if (strength == 3 || strength === 4){
        strengthIndicator.style.color = "orange";
        strengthMessage.textContent = "Moderate Password";
      } else {
        strengthIndicator.style.color = "green";
        strengthMessage.textContent = "Strong Password";
      }
    }

    function checkRePassword(rePassword) {
      const password = document.getElementById("password").value;
      const message = document.getElementById("rePasswordMessage");
      const submitButton = document.getElementById("registerButton")

      if (rePassword === password) {
        message.textContent = "Passwords match!";
        message.style.color = "green";
        submitButton.disabled = false;
      } else {
        message.textContent = "Passwords do not match.";
        message.style.color = "red";
        submitButton.disabled = true;
      }
    }
    function validateEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const emailMessage = document.getElementById("emailMessage");
      const submitButton = document.getElementById("registerButton")

      if (emailRegex.test(email)) {
        emailMessage.textContent = "valid email address.";
        emailMessage.style.color = "green"
        submitButton.disabled = false;
      } else {
        emailMessage.textContent = "Invalid email address!";
        emailMessage.style.color = "red";
        submitButton.disabled = true;
      }
    }

    document.addEventListener("DOMContentLoaded", function () {
      const form = document.querySelector("form");
      form.onsubmit = encryptPassword;
    });

  </script>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .container {
      width: 100%;
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px 30px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    h3 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
      color: #444;
      text-align: center;
    }

    .input {
      display: flex;
      flex-direction: column;
      gap: 5px;
    }

    .input span {
      font-size: 14px;
      font-weight: bold;
      color: #555;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 4px;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      outline: none;
      border-color: #007bff;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      padding: 10px 15px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }

    input[type="submit"]:disabled {
      background-color: #ccc;
      cursor: not-allowed;
    }

    p {
      font-size: 14px;
      margin: 5px 0;
    }

    #strengthIndicator {
      font-weight: bold;
      margin-top: 5px;
    }

    .alert {
      padding: 10px 15px;
      border-radius: 4px;
      font-size: 14px;
      margin-bottom: 20px;
    }

    .alert-danger {
      background-color: #f8d7da;
      color: #721c24;
    }

    .alert-success {
      background-color: #d4edda;
      color: #155724;
    }

    .register-but {
      text-align: center;
    }

    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }
    }

  </style>

</head>
<body>
    <div class="account">
        <div class="container">
          <div class="register">
          <c:if test="${!empty msg}">
            <div class="alert alert-danger">${msg}</div>
          </c:if>
            <form action="${pageContext.request.contextPath}/register" method="post">
              <div class="register-top-grid">
                <h3>Register</h3>
                <div class="input">
                  <span>username <label style="color: red;">*</label> </span>
                  <input type="text" name="username" placeholder="input the username" required="required">
                </div>
                <div class="input">
                  <span>password <label style="color: red">*</label> </span>
                  <input type="password" name="password" id="password" oninput="checkPasswordStrength(this.value)" placeholder="input the password" required="required">
                  <p id="strengthIndicator">Strength: <span id="strengthMessage">-</span> </p>
                </div>
                <div class="input">
                  <span>re-password<label style="color: red">*</label> </span>
                  <input type="password" name="re-password" id="re-password" oninput="checkRePassword(this.value)" placeholder="re-input the password" required="required">
                  <p id="rePasswordMessage" style="font-size: 14px;"></p>
                </div>
                <input type="hidden" name="encryptedPassword" id="encryptedPassword">
                <div class="input">
                  <span>email <label style="color: red">*</label> </span>
                  <input type="text" name="email" placeholder="input your email address" required="required" oninput="validateEmail(this.value)">
                  <p id="emailMessage" style="font-size: 14px;"></p>
                </div>
              </div>
              <div class="register-but text-center">
                <input name="register" type="submit" value="register">
              </div>

              <c:if test="${failsMsg}">
                <div class="alert alert-danger"><p>${failMsg}</p></div>
              </c:if>

              <c:if test="${successMsg}">
                <div class="alert alert-success">Registration successful! Redirecting...</div>
              </c:if>
            </form>
          </div>
        </div>
    </div>
</body>
</html>
