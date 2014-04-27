define ['jquery','knockout'], ($, ko) ->
    class User
        visible: ko.observable no

        activate: () =>
            @visible true

        finish: () =>
            @visible false


    new User()
