// Get the current count from localStorage or set it to 0 if it doesn't exist
var count = localStorage.getItem('pageViewCount') || 0;

// Increment the count by 1
count++;

// Store the new count in localStorage
localStorage.setItem('pageViewCount', count);

// Output the count to the console/the page
// console.log('Page view count: ' + count);

// Display the count on the page
var countElement = document.getElementById('pageViewCount');
countElement.innerHTML = count;