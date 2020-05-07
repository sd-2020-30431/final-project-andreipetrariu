<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Online Library</title>
       <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="login-content">
            <div class="login-panel">
                <div class="login-box">
                    <span style="font-size:1.5em;">Online Library</span>
                    <br><br><br>
                    <form:form action="loginForm" modelAttribute="user">
                    	<div class="login-field">
                    		Username
                  		<form:input path="username"/>
                    	<span style="color:red; font-family: Avenir; font-size:0.7em;" >${usernameError}</span>
                    	</div>
                  		<div class="login-field">
                  	   		Password
                  		<form:password path="password"/>
                  		<span style="color:red; font-family: Avenir; font-size:0.7em;" >${passwordError}</span>
                    	</div>
                  		<br><br>   	
                  		<span style="color:red; font-family:Avenir; font-size:0.8em;"><c:out value="${registerMessage}"/></span>
                		<br><br>
                  		<input type="submit" name="login" value="     Login     "/>
                  		&nbsp &nbsp &nbsp &nbsp &nbsp
                  		<input type="submit" name="login" value="     Register     "/>
                  	</form:form>
               </div>
            </div>
        </div>
    </body>
</html>