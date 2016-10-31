package com.projetpois

import com.projetpois.user.User
import com.projetpois.user.UserRole
import grails.transaction.Transactional

@Transactional
class UserService {

    User createUser( params ) {
        User new_user = new User(username: params.username, mail: params.mail, password: params.password).save()

        UserRole.create new_user, params.role, true

        return new_user
    }
}
