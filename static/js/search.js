// Indices to search
let sites_idx = [];
let trackers_idx = [];
let blog_idx = [];


fetch(`${pathToRoot}/sitemap.json`)
    .then(function (response) {
        return response.json();
    })
    .then(function (data) {
        // Update indices
        sites_idx = data.site;
        trackers_idx = data.tracker;
        blog_idx = data.blog;
       
        autocomplete(document.getElementById("search-bar"));
    });


function compare(a, b) {
    if (a.score < b.score){return -1;}
    if (a.score > b.score){return 1;}
    return 0;
}

function editDistance(s1, s2) {
    const m = s1.length;
    const n = s2.length;
    const dTable = [];

    for (let i = 0; i < m+1; i += 1) {
        dTable.push(Array(n+i).fill(0))
    }

    for (let i = 0; i < m+1; i += 1) {
        for (let j = 0; j < n+1; j += 1) {
            if ( i == 0) {dTable[i][j] = j}
            else if (j == 0) {dTable[i][j] = i}
            else if (s1[i-1] == s2[j-1]) {
                dTable[i][j] = dTable[i-1][j-1];
            }
            else {
                dTable[i][j] = 1 + Math.min(
                    dTable[i][j-1],
                    dTable[i-1][j],
                    dTable[i-1][j-1]
                )
            }
        }
    }
    return dTable[m][n]
}

function search(query, idx) {
    const matches = [];
    for (let i = 0; i < idx.length; i += 1) {
        // is identical
        if (query == idx[i].normalized_name) {
            idx[i].score = idx[i].weight * 10**6;
            matches.push(idx[i]);
        }
        // is substring
        else if (idx[i].normalized_name.indexOf(query) !== -1) {
            idx[i].score = idx[i].weight * 10**5;
            matches.push(idx[i]);
        }
        // edit distance of 1
        else {
            // TODO: tokenize idx[i]
            // tokens = query.split(" ");
            if (matches.length < 5) {
                if (editDistance(query, idx[i].normalized_name) < 3){
                    idx[i].score = idx[i].weight * 100;
                    matches.push(idx[i]);
                } else if (editDistance(query, idx[i].normalized_name) < 4){
                    idx[i].score = idx[i].weight * 50;
                    matches.push(idx[i]);
                }    
            }
        }
    }
    return matches.sort(compare).reverse().slice(0, 5);
}

function inArray(obj, arr){
    let found = false;
    for (let i = 0; i < arr.length; i += 1) {
        if (arr[i].normalized_name == obj.normalized_name) {
            found = true;
            break;
        }
    }
    return found;
}


/* 
 * Gets list of results by category and updates the dropdown
 */
function createList(parent, arr, name) {
    if (arr){
        if (arr.length > 0) {
            /*for each item in the results...*/
            header = document.createElement("DIV");
            header.setAttribute("class", "disabled");
            header.innerHTML = `<h6>${name}</h6>`;
            parent.appendChild(header);
            for (i = 0; i < arr.length; i++) {
                /*create a DIV element for each matching element:*/
                b = document.createElement("DIV");
                b.setAttribute("href", arr[i].url);
                b.innerHTML = `<a href="${pathToRoot + arr[i].url}">${arr[i].name} <i class="fa fa-sign-out" aria-hidden="true"></i>`
    
                /*insert a input field that will hold the current array item's value:*/
                b.innerHTML += "<input type='hidden' value='" + arr[i].name + "'>";
                parent.appendChild(b);
            }
        }
    }
}

/*
 * Adapted from https://www.w3schools.com/howto/howto_js_autocomplete.asp
 */
function autocomplete(inp) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    let currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function (e) {
        let a, b, i, val = this.value;
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) { return false; }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "-autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);

        // RESULTS for query
        query = val.toLowerCase().trim();

        // getting results
        let sites = search(query, sites_idx);
        let trackers = search(query, trackers_idx);
        let blogposts = search(query, blog_idx);

        // Update UI
        createList(a, sites, "websites");
        createList(a, trackers, "trackers");
        createList(a, blogposts, "blogposts");
    });
    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function (e) {
        let x = document.getElementById(this.id + "-autocomplete-list");
        if (x) {
            x = x.getElementsByTagName("div");
        }
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            if (currentFocus + 1 < x.length) {
                if (x[currentFocus + 1].classList.contains('disabled')) {
                    currentFocus += 2;
                } else {
                    currentFocus += 1;
                }
            } else {
                currentFocus = 1;
            }
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            if (x[currentFocus - 1].classList.contains('disabled')) {
                currentFocus -= 2;
            } else {
                currentFocus -= 1;
            }
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13 & currentFocus) {
            if (!x[currentFocus].classList.contains('disabled')) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    // if (x) x[currentFocus].click();
                    window.location.href = pathToRoot + x[currentFocus].getAttribute("href");
                }
            }

        }
    });
    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (let i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        let x = document.getElementsByClassName("autocomplete-items");
        for (let i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}
