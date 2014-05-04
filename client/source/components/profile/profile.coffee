define [
    'components/profile/login'
    'components/profile/user'
    'components/profile/admin'
], (login, user, admin) ->
    page = (u) ->
        switch u.rank
            when 'User' then user
            when 'Modifier' then user
            when 'Administrator' then admin
            else login

    page
