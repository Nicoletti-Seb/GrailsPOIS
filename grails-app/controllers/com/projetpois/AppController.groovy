package com.projetpois

import com.projetpois.poi.Category
import grails.plugin.springsecurity.annotation.Secured

@Secured(['isAuthenticated()'])
class AppController {
    def index() {
        List<Category> categories = Category.list();
        render(view:"/index", model:[categories: categories]);
    }
}
