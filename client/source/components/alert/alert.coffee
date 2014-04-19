define ['jquery', 'knockout'],($, ko) ->
    class AlertPage
        error: ko.observable
            title: ''
            message: ''
            code: 0
            trace: []

        showFullError: ko.observable no

        visible: no

        activate: () =>
            @visible yes
            @showFullError no

    new AlertPage()
