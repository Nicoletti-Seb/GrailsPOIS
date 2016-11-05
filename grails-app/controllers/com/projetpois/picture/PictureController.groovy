package com.projetpois.picture

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.NO_CONTENT

@Transactional(readOnly = true)
@Secured(['ROLE_USER', 'ROLE_MODERATOR', 'ROLE_ADMIN'])
class PictureController {

    static allowedMethods = [delete: "DELETE"]

    @Transactional
    def delete() {

        //Picture
        Picture picture = Picture.get(params.getInt("idPicture"))
        if(picture == null){
            render (status: HttpStatus.NOT_FOUND, text:"Error -> id = ${params.id} not found")
            return;
        }

        //Path
        params.typeObject = params.typeObject.toLowerCase();
        String path = ""
        if ("poi" == params.typeObject ){
            path = grailsApplication.config.images.pois.path
        } else if ( "category" == params.typeObject ){
            path = grailsApplication.config.images.categories.path;
        }

        if(path.isEmpty()){
            render (status: HttpStatus.BAD_REQUEST, text:"Error -> type not in [ poi, category ]")
            return;
        }

        //remove files
        new File(path + picture.name).delete()

        //remove object
        picture.delete(flush: true)

        render status: NO_CONTENT
    }
}
