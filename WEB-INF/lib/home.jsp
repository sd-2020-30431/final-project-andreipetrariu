<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Online Library</title>
	
		<link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet" />
    	<script src="${pageContext.request.contextPath}/resources/main.js"></script>

    </head>
    <body>
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
                    <div class="menu-link">
                        <a href="home-page">Home</a>
                    </div>
                    <div class="menu-link">
                        <a href="mybooks.html">My Books</a>
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
        </div>
        <div class="home-background">
            <div class="home-content">
                <div class="categories">
                  <a style="padding-bottom:20px; font-size:1.0em;">Categories</a>
                    <a href="#recent" class="category" onclick="getBookshelf('recent')">Recent books</a>
                    <button class="category-btn" id="fictional" onclick="openCategory('fictional')">Fictional
                        <i class="btn-caret-down"></i>
                      </button>
                      <div class="subcategory">
                        <a href="#Aua" onclick="getBookshelf('Aua')">Aua</a>
                        <a href="#">Baua</a>
                        <a href="#">Caua</a>
                      </div>
                    <button class="category-btn" id="nonfictional" onclick="openCategory('nonfictional')">Non-Fictional
                        <i class="btn-caret-down"></i>
                    </button>
                    <div class="subcategory">
                        <a href="#">Ana</a>
                        <a href="#">Bana</a>
                        <a href="#">Cana</a>
                      </div>
                </div>
                <div class="library">
                  <div id="section" style="font-family: Avenir;font-size:1.0em; text-align:center">
                    Recent books
                  </div>
                  <div class="bookshelf">
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                    <div class="book">aaaaaaaaaaa</div>
                  </div>
                </div>
            </div>
            <br><br><br><br><br><br><br><br>
        </div>
    </body>
</html>