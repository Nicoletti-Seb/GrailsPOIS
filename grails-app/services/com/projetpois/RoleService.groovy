package com.projetpois

import com.projetpois.user.Role
import grails.transaction.Transactional

@Transactional
class RoleService {

    Role createRole( params ) {
        return new Role(authority: params.authority).save(flush: true, failOnError: true)
    }
}
