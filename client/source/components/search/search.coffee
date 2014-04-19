define ['jquery', 'knockout'], ($, ko) ->
    class SearchPage
        searchText: ko.observable ''

        visible: ko.observable no

        activate: () =>
            @searchText ''
            @visible yes

    new SearchPage()
