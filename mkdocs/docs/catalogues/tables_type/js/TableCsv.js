export default class {
	/**
	 * @param {HTMLTableElement} root 
	 */
	constructor(root) {
		this.root = root;
	}
	
	
	/**
	 * Clear all existing and replace it with new data
	 *
	 * @param {string[][]} data
	 * @param {string[]} headerColumns
	 */	
	update(data, headerColumns = []){	
		this.clear();
		this.setHeader(headerColumns);
		this.setBody(data);	
	}
	
	
	/**
	 * Clear all contents of the table (incl. the header)
	 */			
	clear() {
		this.root.innerHTML = "";
	}
	
	/**
	 * Sets the table header
	 * 
	 * @param {string[]} headerColumns 
	 */
	 
	setHeader(headerColumns) {
		this.root.insertAdjacentHTML("afterbegin", `
			<thead>
				${ headerColumns.map(text => `<th>${text}</th>`).join("") }
			</thead>
		`)
	}
	/**
	 * Sets the table body
	 * 
	 * @param {string[]} data 
	 */
	setBody(data) {
		const rowsHtml = data.map(row => {
			return `
				<tr onclick = "location.href = '#'" style="color: black;">
					${ row.map(text => `<td>${ text }</td>` ).join("") }
				</tr>
			`;
		});
		
		this.root.insertAdjacentHTML("beforeend", `
			<tbody>
				${ rowsHtml.join("") }
			</tbody>
		`)
	}
}