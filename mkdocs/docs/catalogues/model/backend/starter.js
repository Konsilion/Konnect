setTimeout(function(){
    all_grid();
    var loader = document.getElementById("container-loader");
    var content = document.getElementById("content");
    w3AddClass(loader, "hide")
    w3RemoveClass(content, "hide")
    //HideShowFilters('filters-zone')
}, 2000);

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("grid-filter");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function(){
    if(this.classList.contains("active")){
        this.className = this.className.replace(" active", "");
    } else {
        this.className += " active";
    }
  });
}


// Add or remove active class to the current button
var btnContainer = document.getElementById("grid-s-filter");
var btns = btnContainer.getElementsByClassName("btn-family");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function(){  
    if(this.classList.contains("active")){
        this.className = this.className.replace(" active", "");
    } else {
        this.className += " active";
    }
  });
}

document.getElementById("catalog-navbar").style.display = "block";
