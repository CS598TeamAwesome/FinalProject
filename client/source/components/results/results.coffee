define ['jquery', 'knockout'], ($, ko) ->
    class ResultsPage
        results: ko.observableArray []

        visible: ko.observable no

        activate: (res) =>
            @results.removeAll()
            ko.utils.arrayPushAll @results, res
            @visible yes

        finish: () =>
            @visible no

    new ResultsPage()
