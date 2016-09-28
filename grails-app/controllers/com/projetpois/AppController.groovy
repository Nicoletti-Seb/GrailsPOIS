package com.projetpois

import grails.plugin.springsecurity.annotation.Secured

class AppController {

    @Secured(['permitAll'])
    def index() {
        render(view:"/index");
    }


}
