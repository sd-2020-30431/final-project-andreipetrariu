<!DOCTYPE html>
<%@page import="java.time.ZoneId"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<html>
    <head>
        <meta charset="utf-8" />
        <title>Online Library</title>
        <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/jquery3-5-1.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/main.js"></script>
    </head>
    <body>
        <div class="content">
            <div class="menu">
            <div class="menu-icon">
                <div class="icon">
                    <a href="home?user=${username }"><img src="${pageContext.request.contextPath}/resources/bluebook.png" alt="icon"></a>
                </div>
                <div class="title">
                    Online Library
                </div>
            </div>
        <div class="menu-links">
            <div class="menu-link">
                <a href="home?user=${username }">Home</a>
            </div>
            <div class="menu-link">
                <a href="profile">My Books</a>
            </div>
            <div class="settings-dropdown">
                <img src="${pageContext.request.contextPath}/resources/gear-2.png" onclick="showSettings()"></img>
                <div id="settings-option1" class="settings-dropdown-content">
                  <a href="#">Change password</a>
                  <a href="#">Logout</a>
                </div>
              </div> 
        </div>
    </div>
        <div class="home-background">
            <div class="editor-content">
                <form:form action="modify?user=${username}" modelAttribute="bookText">
                	<form:hidden path="id" value="${id}"/>
               		<form:textarea path="text" value="${text}"  style="width:100%;min-height:450px; font-family: Arial; font-size:0.9em;overflow:scroll;"/>
        			<input type="submit" name="editorAction" class="modify-button" id="modifyDone" value="Write"/>
              		<input type="submit" name="editorAction" class="modify-button" id="modifyStop" value="Cancel"/>
              	</form:form>
            </div>
        </div>
    </div>
    </html>