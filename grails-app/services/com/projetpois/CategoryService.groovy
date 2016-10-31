package com.projetpois

import com.projetpois.picture.Picture
import com.projetpois.poi.Category
import com.projetpois.poi.Poi
import grails.transaction.Transactional

@Transactional
class CategoryService {

    PoiService poiService
    PictureService pictureService

    Category createCategory(params) {
        Category category = new Category(name: params.name, description: params.description).save()
        category.addToPictures(pictureService.createPicture(name: params.image_name))

        for (int i = 0; i < params.nb_pois; i++) {
            poiService.createPoi(name: "Poi " + params.name + "_" + i,
                    description: "Le poi" + params.name + "_" + i + "!",
                    address: "1645 Route des Lucioles, 06410 Biot",
                    x: 0 + Math.random() * 5,
                    y: 45 + Math.random() * 5,
                    image_name: params.image_name,
                    category: category,
                    user: params.user)
        }

        return category
    }
}
