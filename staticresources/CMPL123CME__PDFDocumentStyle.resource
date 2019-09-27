/**
* Custom CSS Stylesheet that utilizes CSS 3.0 techniques to create repeating headers
* when applied to a PDF that is rendered from a Salesforce Visualforce page.
*
* @author  John De Santiago
* @version	2010-09-23
*
* Liability and Warranty Disclaimer: This script is provided "as is" and without any warranties 
* as to performance or merchantability, or any other warranties, whether expressed or implied. 
* All scripts are supplied free but are unsupported. Do enjoy!
*/
@page { 
	size: letter portrait;
	border:1px solid black;
	margin-top: 150px;
	margin-bottom: 80px;
	
	@top-left {
		content: element(header_left);
	}
	
	@top-center {
		content: element(header_center);
	}
	
	@top-right {
		content: element(header_right);
	}
	
	@bottom-left {
		content: element(footer_left);
	}
	
	@bottom-center {
		content: element(footer_center);
	}
	
	@bottom-right {
		content: element(footer_right);
	}
}

.header_left {
	text-align: left;
    position: running(header_left);
}

.header_center{
	text-align: center;
	position: running(header_center);
}

.header_right {
	text-align: right;
	position: running(header_right);
}

.footer_left {
	text-align: left;
	position: running(footer_left);
}

.footer_center {
	text-align: center;
	position: running(footer_center);
}

.footer_right {
	text-align: right;
	position: running(footer_right);
}

.pageNumber:before {
	content: counter(page); 
}

.pageCount:before {
	content: counter(pages);  
}

.contentBody { 
	font-family: 'Arial Unicode MS'; 
	height: 0px;
}

.fieldContainer {
	font-size: 10px;
	font-family: sans-serif;
	margin-left: 22px;
}

.fieldLabelMargin {
	margin-top: 4px;
}

.fieldContainerFontFamily {
	font-family: 'Arial Unicode MS';
}

.fieldContainerMargin > span {
    font-weight: bold; 
}

.wrapWhiteSpace {
	white-space: pre-wrap;
}