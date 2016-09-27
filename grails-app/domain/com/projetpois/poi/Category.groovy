package com.projetpois.poi

import com.projetpois.picture.Picture

class Category {

    String name

    String description

    static hasMany = [pois:Poi, pictures:Picture]
    static mappedBy = [pois:'category']

    static constraints = {
        name (nullable: false, blank: false)
        description (nullable: false, blank: true)
    }
}
