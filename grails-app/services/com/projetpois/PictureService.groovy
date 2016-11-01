package com.projetpois

import com.projetpois.picture.Picture
import grails.transaction.Transactional

@Transactional
class PictureService {

    Picture createPicture( params ) {
        return new Picture(name: params.name).save(flush: true, failOnError: true)
    }
}
