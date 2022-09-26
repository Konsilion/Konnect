import TableCsv from "./TableCsv.js";

const tableRoot = document.querySelector("#csvRoot");
const csvFileInput = document.querySelector("#csvFileInput");
const tableCsv = new TableCsv(tableRoot);


Papa.parse("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv", { 
	download: true,
	delimiter: ";",
	skipEmptyLines: true,
	complete: results => {
		tableCsv.update(results.data.slice(1), results.data[0]);
	}
});

