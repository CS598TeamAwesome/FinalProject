define ['jquery','knockout'], ($, ko) ->
    class NewObject
        visible: ko.observable no

        activate: () =>
            @visible yes

        finish: () =>
            @visible no

    new NewObject()
