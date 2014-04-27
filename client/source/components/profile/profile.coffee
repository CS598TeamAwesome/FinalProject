define [
    'components/profile/login'
    'components/profile/user'
], (login, user) ->
    page = (u) ->
        switch u.rank
            when 'user' then user
            when 'modifier' then user
            when 'administrator' then user
            else login

    page
