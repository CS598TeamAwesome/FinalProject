define [
    'components/profile/login'
    'components/profile/user'
    'components/profile/admin'
], (login, user, admin) ->
    page = (u) ->
        switch u.rank
            when 'user' then user
            when 'modifier' then user
            when 'administrator' then admin
            else login

    page
