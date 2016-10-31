package com.projetpois

import com.projetpois.poi.Poi
import grails.transaction.Transactional

@Transactional
class PoiService {

    PictureService pictureService

    Poi createPoi(params) {
        Poi poi = new Poi(name: params.name,
                description: params.description,
                address: params.address,
                x: params.x,
                y: params.y).addToPictures(pictureService.createPicture(name: params.image_name))

        params.category.addToPois(poi)
        params.user.addToPois(poi)

        poi.save(flush: true, failOnError: true)

        return poi
    }
}
