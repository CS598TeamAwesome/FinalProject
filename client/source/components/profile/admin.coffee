define ['jquery','knockout', 'bootstrap'], ($, ko) ->
    class Administrator
        visible: ko.observable no

        activate: () =>
            @visible true

        finish: () =>
            @visible false

        init: (user) ->
            $('#changepw').click (e) ->
                newPass = $('#cpNewPass').val()
                newPassV = $('#cpNewPassV').val()
                oldPass = $('#cpOldPass').val()

                if (newPass isnt '') and (newPassV isnt '') and (oldPass isnt '')
                    (user.setPassword oldPass, newPass) if newPass is newPassV



    new Administrator()
