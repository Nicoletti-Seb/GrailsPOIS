package com.projetpois

import com.projetpois.poi.Category
import grails.plugin.springsecurity.annotation.Secured

class AppController {
    @Secured(['permitAll'])
    def index() {
        List<Category> categories = Category.list();
        render(view:"/index", model:[categories: categories]);
    }
}
