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

function openCategory(name) {
  var category = document.getElementById(name);
  category.classList.toggle("category-btn-active");
  var dropdownContent = category.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } 
  else {
  dropdownContent.style.display = "block";
  }
}

function getBookshelf(type) {
  switch(type) {
    case "recent": document.getElementById("section").innerHTML = "Recent books";break;
    case "Aua": document.getElementById("section").innerHTML = "Aua";break;  
  }

}