window.onload = function() {
    document.getElementById('csv-file').addEventListener(
        'change', preview_csv, false
    );
}

function preview_csv(e) {
    if (!e.target.files.length) {
        alert("Please choose a csv file...");
        return
    }

    const file = e.target.files[0];

    // parse file then pass to html generator
    Papa.parse(file, {
        complete: function(result) {
            if (result.data && result.data.length > 0) {
                htmlTableGenerator(result.data)
            }
        }
    });
}