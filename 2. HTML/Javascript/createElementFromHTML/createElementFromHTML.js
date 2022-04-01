// http://vigges.net/?qa=398452/
function createElementFromHTML(htmlString) {
    var div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild; 
}
function createTd_ElementFromHTML(htmlString) {
    var div = document.createElement('div');
    div.innerHTML = "<table><tr>"+htmlString.trim()+"</table></tr>";
    return div.firstChild.firstChild.firstChild.firstChild; 
}
