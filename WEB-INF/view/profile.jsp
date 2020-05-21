<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
    <head>
        <meta charset="utf-8" />
        <title>Online Library</title>
        <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" />
    	<script src="${pageContext.request.contextPath}/resources/main.js"></script>
    </head>
    <body>
    	<div class="upload-form">
    	   <span class="close-form" style="right:100px;" onclick="closeUploadForm()">&times;</span>
    	   <form:form method="post" id="upload" action="uploadFile?user=${username}" modelAttribute="uploadForm"  enctype="multipart/form-data">
    	   		<div class="login-field" style="padding-top:8px;">Book title</div>
    	   		<form:errors path="bookName" cssClass="error-msg"/>
    	   		<form:input path="bookName" style="width:100%;"/>
    	   		<div class="login-field" style="padding-top:8px;">Category</div>
    	   		<form:errors path="category" cssClass="error-msg"/>
    	   		<form:input path="category" style="width:100%;"/>
    	   		<div class="login-field">Permission</div>
    	   		<form:select path="permission">
    				<form:option value="read">Read</form:option>
    				<form:option value="readwrite">Read and Write</form:option>
  				</form:select>
           		<div class="login-field">Select a file:</div>
           		<form:errors path="bookFile" cssClass="error-msg"/>
                <form:input path="bookFile" type="file" name="file" />
                <button type="submit">Upload</button>  
           </form:form>
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
        <div class="profile-content">
            <div class="profile-navigation">
                <button class="modify-button" style="width:100%; margin-top:0px;" onclick="showFavoriteBooks()">Favorite books</button>
                <button class="modify-button" style="width:100%;" onclick="showPublishedBooks()">Published books</button>
                <button type="button" class="modify-button" id="uploadButton" onclick="showUploadForm()" style="width:100%; background-color: darkgreen;  border: 2px solid black;" >Upload a book</button>
            	<span class="error-msg">
            		${uploadErrorMsg}
            	</span>
            </div>
            <div class="profile-body">
                <div class="library">
                    <div id="section" style="font-family: Avenir;font-size:1.0em; text-align:center">
                      Favorite Books
                    </div>
                    <div class="bookshelf" id="favoriteBooks">
	                    <c:forEach items="${favoriteBooks}" var="item">
	                          <div class="book" onclick="window.location='book?id=${item.getId()}';">
	                              <div class="book-thumbnail">
	                                  <img src="${pageContext.request.contextPath}/resources/images/${item.getContentPath()}.png"></img>
	                                  Sample book
	                              </div>
	                              <div class="book-feedback">
	                                  0,0
	                              </div>
	                          </div>
	                   	</c:forEach>
                   	</div>
                   	<div class="bookshelf" id="publishedBooks">
                   		<c:forEach items="${publishedBooks}" var="item">
	                          <div class="book" onclick="window.location='book?id=${item.getId()}';">
	                              <div class="book-thumbnail">
	                                  <img src="${pageContext.request.contextPath}/resources/images/${item.getContentPath()}.png"></img>
	                                  Sample book
	                              </div>
	                              <div class="book-feedback">
	                                  0,0
	                              </div>
	                          </div>
	                   	</c:forEach>
                   	</div>
                  </div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>