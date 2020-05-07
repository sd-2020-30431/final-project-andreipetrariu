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
                        <a href="">Home</a>
                    </div>
                    <div class="menu-link">
                      <a href="login">Login</a>
                  </div>
                </div>
            </div>
        </div>
        <div class="home-background">
            <div class="home-content">
                <div class="categories">
                  <a style="padding-bottom:20px; font-size:1.0em;">Categories</a>
                    <a href="#recent" class="category" onclick="getBookshelf('recent')">Recent books</a>
                    <button class="category-btn">Fictional
                        <i class="btn-caret-down"></i>
                      </button>
                      <div class="subcategory">
                        <a href="#Aua" onclick="getBookshelf('Aua')">Aua</a>
                        <a href="#">Baua</a>
                        <a href="#">Caua</a>
                      </div>
                    <button class="category-btn">Non-Fictional
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


<script>
    // When the user clicks on <div>, open the popup
function showSettings() {
  var popup = document.getElementById("settings-option1");
  popup.classList.toggle("show");
}
window.onclick = function(event) {
  if (!event.target.matches('.settings-dropdown img')) {
    var dropdowns = document.getElementsByClassName("settings-dropdown");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
} 
var dropdown = document.getElementsByClassName("category-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("category-btn-active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } 
  else {
  dropdownContent.style.display = "block";
  }
  });
}

function getBookshelf(type) {
  switch(type) {
    case "recent": document.getElementById("section").innerHTML = "Recent books";break;
    case "Aua":document.getElementById("section").innerHTML = "Aua";break;  
  }

}

</script>