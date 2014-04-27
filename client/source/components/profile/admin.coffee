define ['jquery','knockout', 'bootstrap'], ($, ko) ->
    class Administrator
        visible: ko.observable no

        activate: () =>
            @visible true

        finish: () =>
            @visible false

        init: () ->
            $('#tabs a').click (e) ->
                e.preventDefault()
                $(this).tab 'show'


    new Administrator()
