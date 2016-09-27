package com.projetpois.poi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poiInstanceCount: Poi.count()]
    }

    def show(Poi poiInstance) {
        respond poiInstance
    }

    def create() {
        respond new Poi(params)
    }

    @Transactional
    def save(Poi poiInstance) {
        if (poiInstance == null) {
            notFound()
            return
        }

        if (poiInstance.hasErrors()) {
            respond poiInstance.errors, view:'create'
            return
        }

        poiInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'Poi'), poiInstance.id])
                redirect poiInstance
            }
            '*' { respond poiInstance, [status: CREATED] }
        }
    }

    def edit(Poi poiInstance) {
        respond poiInstance
    }

    @Transactional
    def update(Poi poiInstance) {
        if (poiInstance == null) {
            notFound()
            return
        }

        if (poiInstance.hasErrors()) {
            respond poiInstance.errors, view:'edit'
            return
        }

        poiInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Poi.label', default: 'Poi'), poiInstance.id])
                redirect poiInstance
            }
            '*'{ respond poiInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Poi poiInstance) {

        if (poiInstance == null) {
            notFound()
            return
        }

        poiInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Poi.label', default: 'Poi'), poiInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'Poi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
