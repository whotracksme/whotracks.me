let options = {
    shouldSort: true,
    tokenize: true,
    includeScore: true,
    threshold: 0.2,
    location: 0,
    distance: 40,
    maxPatternLength: 32,
    minMatchCharLength: 2,
    keys: ["normalized_name"]
};

let idx = []
let fuse = new Fuse(idx, options);
fetch('/sitemap.json')
    .then(function (response) {
        return response.json();
    })
    .then(function (data) {
        idx = data;
        fuse = new Fuse(idx, options)
        autocomplete(document.getElementById("search-bar"), idx);
    });

function compare(a, b) {
    if (a.score < b.score)
        return -1;
    if (a.score > b.score)
        return 1;
    return 0;
}


function structuredResults(arr) {
    let websites = [];
    let trackers = [];
    let blog = [];
    for (let i = 0; i < arr.length; i += 1) {
        if (arr[i].item.type === "site") {
            arr[i].item.icon = 'S: ';
            arr[i].item.score = arr[i].score * arr[i].item.weight;
            websites.push(arr[i].item)
        } else if (arr[i].item.type === "tracker") {
            arr[i].item.score = arr[i].score * arr[i].item.weight;
            // arr[i].item.score = arr[i].item.weight;
            arr[i].icon = 'T: ';
            trackers.push(arr[i].item);
        } else {
            arr[i].item.score = arr[i].score * arr[i].item.weight;
            arr[i].icon = 'B: ';
            blog.push(arr[i].item);
        }
    }
    return [
        websites.sort(compare).reverse().slice(0, 5),
        trackers.sort(compare).reverse().slice(0, 5),
        blog.sort(compare).reverse().slice(0, 5)
    ]
}

function createList(parent, arr, name) {
    if (arr.length > 0) {
        /*for each item in the results...*/
        header = document.createElement("DIV");
        header.setAttribute("class", "disabled");
        header.innerHTML = `<h6>${name}</h6>`;
        parent.appendChild(header);
        for (i = 0; i < arr.length; i++) {
            /*create a DIV element for each matching element:*/
            b = document.createElement("DIV");
            b.setAttribute("href", arr[i].url)
            b.innerHTML = `<a href="${arr[i].url}">${arr[i].name} <i class="fa fa-external-link" aria-hidden="true"></i>`

            /*insert a input field that will hold the current array item's value:*/
            b.innerHTML += "<input type='hidden' value='" + arr[i].name + "'>";
            parent.appendChild(b);
        }
    }
}

function autocomplete(inp, arr) {
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

        // RESULTS FROM FUSE
        let results = fuse.search(val);
        let [sites, trackers, blogposts] = structuredResults(results);

        createList(a, sites, "websites")
        createList(a, trackers, "trackers")
        createList(a, blogposts, "blogposts")

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
