package com.projetpois

import com.projetpois.poi.Category
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER', 'ROLE_MODERATOR', 'ROLE_ADMIN'])
class AppController {
    def index() {
        List<Category> categories = Category.list();
        render(view:"/index", model:[categories: categories]);
    }
}
