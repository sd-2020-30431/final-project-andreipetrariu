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
    <div class="password-form">
    	   <span class="close-password-form" style="right:100px;" onclick="closePasswordForm()">&times;</span>
    	   <form:form method="post" id="passwordForm" action="changePass?user=${username}" modelAttribute="password"  enctype="multipart/form-data" style="min-width:200px;width:22%;min-height:200px;height:20%;">
    	   		<div class="login-field" style="padding-top:8px;">Old password</div>
    	   		<form:errors path="oldPassword" cssClass="error-msg"/>
    	   		<form:password path="oldPassword" style="width:100%;"/>
    	   		<div class="login-field" style="padding-top:8px;">New password</div>
    	   		<form:errors path="newPassword" cssClass="error-msg"/>
    	   		<form:password path="newPassword" style="width:100%;"/>
                <div><button class="post-button" type="submit" style="margin-top:20px;">Change</button></div>
           </form:form>
    	</div>
        <div class="content">
            <div class="menu">
                <div class="menu-icon">
                    <div class="icon">
                        <a href=""><img src="${pageContext.request.contextPath}/resources/bluebook.png" alt="icon"></a>
                    </div>
                    <div class="title">
                        Online Library
                    </div>
                </div>
                <div class="menu-links">
                	Welcome, ${username}
                    <div class="menu-link">
                        <a href="home?user=${username}">Home</a>
                    </div>
                    <div class="menu-link">
                        <a href="profile?user=${username}">My Books</a>
                    </div>
                    <div class="settings-dropdown">
                        <img src="${pageContext.request.contextPath}/resources/gear-2.png" onclick="showSettings()"></img>
                        <div id="settings-option1" class="settings-dropdown-content">
                          <a onclick="showPasswordForm()">Change password</a>
                          <a href="logout?user=${username}">Logout</a>
                        </div>
                      </div> 
                </div>
            </div>
        <div class="home-background">
            <div class="home-content">
                <div class="categories">
                  <a style="padding-bottom:20px; font-size:1.0em;">Categories</a>
                    <a href="home?user=${username}&category=recent" recent" class="category" onclick="getBookshelf('recent')">Recent books</a>
                    <button class="category-btn" id="fictionalBtn" onclick="openCategory('fictionalBtn')")>Fictional
                        <i class="btn-caret-down"></i>
                      </button>
                      <div class="subcategory">
                        <a href="home?user=${username}&category=adventure">Adventure</a>
                        <a href="home?user=${username}&category=detective">Detective</a>
                        <a href="home?user=${username}&category=realism">Realism</a>
                        <a href="home?user=${username}&category=historical">Historical</a>
                        <a href="home?user=${username}&category=scifi">Science Fiction</a>
                        <a href="home?user=${username}&category=myth">Myth</a>
                        <a href="home?user=${username}&category=fantasy">Fantasy</a>
                        <a href="home?user=${username}&category=comics">Comics</a>
                        <a href="home?user=${username}&category=fable">Fable</a>
                        <a href="home?user=${username}&category=romance">Romance</a>
                        <a href="home?user=${username}&category=horror">Horror</a>
                        <a href="home?user=${username}&category=poetry">Poetry</a>
                        <a href="home?user=${username}&category=drama">Drama</a>
                      </div>
                    <button class="category-btn" id="nonFictionalBtn" onclick="openCategory('nonFictionalBtn')">Non-Fictional
                        <i class="btn-caret-down"></i>
                    </button>
                    <div class="subcategory">
                        <a href="home?user=${username}&category=biography" >Biography</a>
                        <a href="home?user=${username}&category=tech" >Technology</a>
                        <a href="home?user=${username}&category=business">Business</a>
                        <a href="home?user=${username}&category=religion" >Religion</a>
                        <a href="home?user=${username}&category=history" >History</a>
                        <a href="home?user=${username}&category=law" >Law</a>
                        <a href="home?user=${username}&category=education" >Education</a>
                        <a href="home?user=${username}&category=selfhelp" >Self-help</a>
                        <a href="home?user=${username}&category=cookbooks" >Cookbooks</a>
                        <a href="home?user=${username}&category=encyclopedia" >Encyclopedia</a>
                        <a href="home?user=${username}&category=catalogs">Catalogs</a>
                        <a href="home?user=${username}&category=guides">Guides</a>
                      </div>
                </div>
                <div class="library">
                  <div id="section" style="font-family: Avenir;font-size:1.0em; text-align:center">
                    ${section}
                  </div>
                  <div class="bookshelf">
                    <c:forEach items="${books}" var="item">
    					<div class="book" onclick="window.location='book?user=${username}&id=${item.getId()}';">
    						<div class="book-thumbnail">
    							<img src="${pageContext.request.contextPath}/resources/default_cover.jpg"></img>
            					${item.getBookName()}
            				</div>
            				<div class="book-feedback">
            					${item.getLikes() }, ${item.getDislikes()}
            				</div>
            			</div>
					</c:forEach>        
                  </div>
                </div>
            </div>
            <br><br><br><br><br><br><br><br>
        </div>
        </div>
    </body>
</html>

