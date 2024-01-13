
document.addEventListener("DOMContentLoaded", function() {
    var searchInput = document.getElementById('search-input')
    var searchResults = document.getElementById('search-results')
    var searchTimer;


    //fetch results on input
    searchInput.addEventListener('input', function() {
        !searchInput.value 
        ? searchResults.innerHTML = ''
        : fetchSearchResults(searchInput.value)
    })
    //record search term
    searchInput.addEventListener('keydown', function() {
        clearTimeout(searchTimer)
    })
    searchInput.addEventListener('keyup', function() {
        clearTimeout(searchTimer)
        searchTimer = setTimeout( function() {
            saveSearchTerm(searchInput.value)
        }, 1000)
    })
    
    function saveSearchTerm(term) {
        term.trim().length &&
        fetch('/searches', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ search: { term: term } })
        })
        .then(response => response.json)
        .then(data => console.log("Search term saved: ", data))
        .catch(err => console.log("Search error: ", err))
    }
    
    function fetchSearchResults(term) {
        term.trim().length &&
        fetch(`/articles/search?term=${encodeURIComponent(term)}`)
        .then(response => response.json())
        .then(data => displaySearchResults(data))
    }
    
    function displaySearchResults(data) {
        searchResults.innerHTML = ''
        if(!data.length) {
            const h5 = document.createElement('h5')
            h5.textContent = "No results found!"
            searchResults.appendChild(h5)
        }
        data.forEach(item => {
            const li = document.createElement('li')
            const h3 = document.createElement('h3')
            const p = document.createElement('p')
    
            h3.textContent = item.title
            p.textContent = item.body
    
            li.appendChild(h3)
            li.appendChild(p)
    
            searchResults.appendChild(li)
        })
    }
})

