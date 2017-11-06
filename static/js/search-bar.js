var options = {
    url: pathToRoot + "/sitemap.json",

    categories: [
    {
        listLocation: "tracker",
        maxNumberOfElements: 4,
        header: "Trackers"
    },
    {
        listLocation: "site",
        maxNumberOfElements: 4,
        header: "Websites"
    }
    ],

    getValue: function(element) {
        return element.name;
    },
    template: {
        type: "links",
        fields: {
            link: function(entry) { return pathToRoot + '/' + entry["url"] }
        }
    },

    list: {
        maxNumberOfElements: 12,
        onChooseEvent: function() {
			var url = $("#search-bar").getSelectedItemData().url;
            window.location.href = pathToRoot + "/" + url;
        },
        match: {
            enabled: true
        },
        sort: {
            enabled: true
        }
    },

    theme: "square"
};

$("#search-bar").easyAutocomplete(options);

// Setting the dropdown width identical to the input group
$('.easy-autocomplete-container').css('width', $('.stylish-input-group').width());
