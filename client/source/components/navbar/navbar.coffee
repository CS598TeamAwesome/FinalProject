define ['jquery', 'knockout'], ($, ko) ->
    class NavBar
        visible: ko.observable true

        activate: () =>
            @visible true

        current: (cls) ->
            ($ '.navbar *').removeClass 'active'
            ($ ".navbar ##{cls}").addClass 'active'

    new NavBar()
