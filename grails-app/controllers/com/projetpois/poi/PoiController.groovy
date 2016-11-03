package com.projetpois.poi

import com.projetpois.picture.Picture
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['permitAll'])
class PoiController {

    static allowedMethods = [save: "POST", update: ["PUT", "POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poiInstanceCount: Poi.count()]
    }

    def show(Poi poiInstance) {
        respond poiInstance
    }

    def list(){
        respond Poi.list()
    }

    def create() {
        respond new Poi(params);
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

        //save file
        if(params.containsKey('uploadFile')){
            List fileList = request.getFiles('uploadFile');
            fileList.each { f ->
                if (!f.empty) {
                    def name = f.getOriginalFilename();
                    poiInstance.addToPictures(new Picture(name: name));
                    f.transferTo(new File(grailsApplication.config.images.pois.path + name))
                }
            }
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

        if(params.containsKey('uploadFile')){
            List fileList = request.getFiles('uploadFile');
            fileList.each { f ->
                if (!f.empty) {
                    def name = f.getOriginalFilename();
                    poiInstance.addToPictures(new Picture(name: name));
                    f.transferTo(new File(grailsApplication.config.images.pois.path + name))
                }
            }
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
