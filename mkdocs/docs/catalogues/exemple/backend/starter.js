setTimeout(function(){
    all_grid();
    var loader = document.getElementById("container-loader");
    var content = document.getElementById("content");
    w3AddClass(loader, "hide")
    w3RemoveClass(content, "hide")
    HideShowFilters('filters-zone')
}, 2000);



