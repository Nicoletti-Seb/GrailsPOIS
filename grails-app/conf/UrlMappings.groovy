
class UrlMappings {

	static mappings = {

        "/$controller/$id?/$action?(.$format)?"{
            constraints {
                id( matches: /\d+/ ) // id == number
            }
        }

        //Url for actions without id (example: create / list )
        "/$controller/$action?(.$format)?"{
            constraints {}
        }

        //Url to delete images
        "/$typeObject/pictures/$idPicture/delete" (controller: "picture", action: "delete"){
            constraints {}
        }

        "/(login)?"(controller: "login", action: "auth")
        "/app"(controller: "app", action: "index")
        "500"(view:'/error')
    }
}