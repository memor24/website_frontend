// get count from localStorage or set it to 0 if non-existed
var count = localStorage.getItem('ViewCount') || 0;

count++;

localStorage.setItem('ViewCount', count);

// show view per session on the page by the ID ref to html
document.getElementById('ViewCount').innerHTML = count; 
