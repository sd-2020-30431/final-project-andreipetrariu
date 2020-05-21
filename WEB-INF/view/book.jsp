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
    	<div class="cover-image" id="fullCoverImage">
  			<span class="close">&times;</span>
  			<img class="cover-image-content" id="img">
		</div>
        <div class="content">
            <div class="menu">
                <div class="menu-icon">
                    <div class="icon">
                        <a href="home?user=${username}"><img src="${pageContext.request.contextPath}/resources/bluebook.png" alt="icon"></a>
                    </div>
                    <div class="title">
                        Online Library
                    </div>
                </div>
                <div class="menu-links">
                    <div class="menu-link">
                        <a href="home?user=${username}">Home</a>
                    </div>
                    <div class="menu-link">
                        <a href="profile?user=${username}">My Books</a>
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
              <div class="book-page-content">
                <div class="book-page-about">
                    <div class="book-page-title">Sample</div>
                  <form:form method="post" action="attemptModify?user=${username}&id=${id}" modelAttribute="theBookText">
                  	<form:hidden path="id" value="${bookText.getId()}"/>
                  	<form:hidden path="text" value="${bookText.getText()}"/>
                  	<button type="submit" class="modify-button" id="modify">Modify</button>
                  </form:form>
                  <span class="error-msg">${modifyErrorMsg}</span>
                  <button type="button" class="modify-button" id="viewImage" style="margin-top:10px;" onclick="showImage('${pageContext.request.contextPath}/resources/images/${bookName}.png')">View cover image</button>
                  <div class="book-page-comments">
                <div class="comment-input">
                 <form:form action="comment" modelAttribute="comment">
                 <form:hidden path="pageId" value="${comment.getPageId()}"/>
                  Write a comment (max. 200 characters)
                  <form:textarea id="inputCommentText" path="content" cssStyle="width:100%; max-width:100%; max-height:70px;"/>
                  <button type="submit" class="post-button">Post</button>
                  </form:form>
                </div>
                <c:forEach items="${comments}" var="comm">
                <div class="comment">
                  <div class="comment-header">
                    Andrei98, ${comm.getPostDate() }
                  </div>
                  <div class="comment-content">
                    ${comm.getContent() }
                  </div>
                  <div class="comment-feedback">
                  <div style="display:block;">
                    <img src="${pageContext.request.contextPath}/resources/lgraylike.png" width="25px" height="25px"><pre style="font-size:1.3em; text-align:center; margin:0px;" >${comm.getLikes() }</pre>
                  </div>  
                  <div style="display:block;"><img src="${pageContext.request.contextPath}/resources/lgraydislike.png" width="25px" height="25px"><pre style="font-size:1.3em; text-align:center; margin:0px;">${comm.getDislikes()}</pre>
                  </div>
                    <button type="button" style="margin-left:20px;" onclick="replyComment(${comm.getUsername()})">Reply</button>
                  </div>
                </div>
                  </c:forEach>
              </div>
                </div>
                <div class="book-page-body">
                	<textarea style="width:100%;height:100%;padding:8px; font-family:Avenir;">${bookText.getText()}</textarea>
              </div>
              
          </div>
          </div>
          </div>
    </body>
</html>