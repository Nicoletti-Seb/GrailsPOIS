
class UrlMappings {

	static mappings = {
        "/$controller/$id?/$action?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "login", action: "auth")
        "/app"(controller: "app", action: "index")
        "500"(view:'/error')

        //Resources
        "/pois"(resources:"poi")

    }
}
