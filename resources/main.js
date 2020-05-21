var modal;
var modalImg;
var span;

function replyComment(username){
	var inputCommentField = document.getElementById('inputCommentText').value=username;
	inputCommentField.scrollIntoView();
}

function startModify(){
	var modifyBtn=document.getElementById("modify");
	var stopBtn=document.getElementById("modifyStop");
	stopBtn.style.display= "inline-block";
	modifyBtn.style.display="none";
	$("#text_book").removeAttr("readonly");
}

function stopModify(){
	var modifyBtn=document.getElementById("modify");
	var stopBtn=document.getElementById("modifyStop");
	modifyBtn.style.display="inline-block";
	stopBtn.style.display="none";
	$("#text_book").attr("readonly",true);
}

document.addEventListener("DOMContentLoaded", function (event) { 
	modal = document.getElementsByClassName("cover-image")[0];
	modalImg = document.getElementById("img");
	span = document.getElementsByClassName("close")[0];
	span.onclick = function() { 
		  modal.style.display = "none";
	}
});

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
//show image

function showImage(name){
  modal.style.display = "block";
  modalImg.src = name;
}

function showUploadForm(){
	var uploadForm = document.getElementsByClassName("upload-form")[0];
	uploadForm.style.display = "block";
}

function showFavoriteBooks(){
	var bookshelf = document.getElementById("favoriteBooks");
	var section = document.getElementById("section");
	section.innerHTML = "Favorite Books"
	bookshelf.style.display = "grid";
	bookshelf = document.getElementById("publishedBooks");
	bookshelf.style.display = "none";
}

function showPublishedBooks(){
	var bookshelf = document.getElementById("favoriteBooks");
	var section = document.getElementById("section");
	section.innerHTML = "Published Books"
	bookshelf.style.display = "none";
	bookshelf = document.getElementById("publishedBooks");
	bookshelf.style.display = "grid";
}

function showPasswordForm(){
	var changePassForm = document.getElementsByClassName("password-form")[0];
	changePassForm.style.display = "block";
}

function closeUploadForm() {
	document.getElementsByClassName("upload-form")[0].style.display = "none";
};

function closePasswordForm(){
	document.getElementsByClassName("password-form")[0].style.display = "none";
}


function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}

function enableModify(){
	doc.contentEditable = true;
	doc.focus();
}

    
    
    
    
    