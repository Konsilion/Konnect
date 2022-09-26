---
hide:
    - toc
    - navigation
---



# Titre 1

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="grid-filter">    
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Filtre en-tête n°1.." title="Type in a name">
            <input type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Filtre en-tête n°2.." title="Type in a country">
        </div>
        <table id="csvRoot"></table>
        <script src="https://cdn.jsdelivr.net/npm/papaparse@5.2.0/papaparse.min.js"></script>
        <script type="module" src="../js/main.js"></script>   
    </body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  
<script>
    $(document).ready(function () {
        $('#csvRoot').DataTable();
    });
</script>




