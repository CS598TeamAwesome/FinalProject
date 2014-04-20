define ['jquery', 'knockout', 'hasher'], ($, ko, hasher) ->
    class NavBar
        visible: ko.observable true

        activate: () =>
            @visible true

        init: () ->
            $('.navbar').find('#search').click () ->
                hasher.setHash ''

            $('.navbar').find('#add').click () ->
                hasher.setHash 'add'

            $('.navbar').find('#browse').click () ->
                hasher.setHash 'browse'

            $('.navbar').find('#profile').click () ->
                hasher.setHash 'profile'

        current: (cls) ->
            ($ '.navbar *').removeClass 'active'
            ($ ".navbar ##{cls}").addClass 'active'

    new NavBar()
