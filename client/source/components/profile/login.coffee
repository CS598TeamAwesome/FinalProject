define ['jquery','knockout'], ($, ko) ->
    class LogIn
        visible: ko.observable no

        email: ko.observable ''
        password: ko.observable ''

        activate: () =>
            @visible true

        finish: () =>
            @visible false


    new LogIn()
