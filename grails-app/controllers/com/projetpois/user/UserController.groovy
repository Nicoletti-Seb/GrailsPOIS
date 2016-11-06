package com.projetpois.user

import grails.plugin.springsecurity.annotation.Secured
import org.omg.CORBA.NO_PERMISSION
import org.springframework.security.core.context.SecurityContextHolder

import java.nio.file.AccessDeniedException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
@Secured(['isAuthenticated()'])
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        return [userInstance: userInstance, canEdit:canEdit()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new User(params)
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def canEdit(User userInstance){
        if( springSecurityService.principal.username == userInstance.username ){
            return true;
        }

        def sessionRoles = springSecurityService.getAuthentication().getAuthorities()
        def userRoles = userInstance.getAuthorities();

        System.out.print(sessionRoles.class);
        System.out.print(sessionRoles[0].class);
        System.out.print(sessionRoles.contains('ROLE_ADMIN'));
        return sessionRoles.any{it.authority == 'ROLE_ADMIN'} ||
                ( sessionRoles.any{it.authority == 'ROLE_MODERATOR'} &&
                        userRoles.any{it.authority == 'ROLE_USER' || it.authority == 'ROLE_MODERATOR'})
    }

    def edit(User userInstance) {
        if(!canEdit()){
            redirect(action: "index")
            return;
        }

        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if(!canEdit()){
            redirect(action: "index")
            return;
        }

        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
