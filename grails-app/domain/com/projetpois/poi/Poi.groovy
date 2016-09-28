package com.projetpois.poi

import com.projetpois.picture.Picture
import com.projetpois.user.User

/**
 * Created by 53js-Seb on 26/09/2016.
 */
class Poi {
    //Name
    String name

    //Location
    String address
    float x
    float y

    //description
    String description

    static hasMany = [pictures: Picture]
    static belongsTo = [createdBy: User, category: Category]
    static mappedBy = [createdBy: 'pois', category: 'pois']

    static constraints = {
        name(nullable: false, blank: false)
        address(nullable: false, blank: false)
        description(nullable: false, blank: true)
        createdBy(nullable: false)
    }
}