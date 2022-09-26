window.onload = function() {
    
    Papa.parse("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv", { 
        download: true,
        delimiter: ";",
        skipEmptyLines: true,
        complete: results => {
            htmlTableGenerator(results.data);
        }
    });      
}



function htmlTableGenerator(content) {
    let csv_preview = document.getElementById('csv-preview');

    let html = '<table id="example" class="display table table-condensed table-hover table-striped" style="width:100%">';

    if (content.length == 0 || typeof(content[0]) === 'undefined') {
        return null
    } else {
        const header = content[0];
        const data = content.slice(1);

        html += '<thead>';
        html += '<tr>';
        header.forEach(function(colData) {
            html += '<th>' + colData + '</th>';
        });
        html += '</tr>';
        html += '</thead>';
        html += '<tbody>';

        data.forEach(function(row) {
            if (header.length === row.length) {
                html += '<tr>';
                row.forEach(function(colData) {
                    html += '<td>' + colData + '</td>';
                });
                html += '</tr>';
            }
        });

        html += '</tbody>';
        html += '</table>';

        // insert table element into csv preview
        csv_preview.innerHTML = html;

        // initialise DataTable
        initDataTable();
    }
}

function initDataTable() {
    $('#example').DataTable({
        stateSave: true,
        scrollX: true,
        scrollY: (window.innerHeight / 1.5) + "px",
        dom: 'lBfrtip',
        language: {
        url: "https://cdn.datatables.net/plug-ins/1.12.1/i18n/fr-FR.json"
    }
    })
    
}