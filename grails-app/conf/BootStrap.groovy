import com.projetpois.picture.Picture
import com.projetpois.poi.Category
import com.projetpois.poi.Poi
import com.projetpois.user.Role
import com.projetpois.user.User
import com.projetpois.user.UserRole

class BootStrap {

    def init = { servletContext ->

        //Roles
        Role adminRole = new Role('ROLE_ADMIN').save()
        Role userRole = new Role('ROLE_USER').save()
        Role modoRole = new Role('ROLE_MODERATOR').save()

        //User
        User testAdmin = new User('root', 'root@gmail.com', 'root').save()
        User testModo = new User('modo', 'modo@gmail.com', 'modo').save()
        User testUser = new User('user', 'user@gmail.com', 'user').save()

        //Init Category
        List<Category> categories = new ArrayList<>()
        categories.add(new Category( name:"Cinema", description: "La liste des cinemas").save())
        categories.add(new Category( name:"Magasin", description: "La liste des magasins").save())
        categories.add(new Category( name:"Touristique", description: "La liste des lieux touristiques").save())
        categories.add(new Category( name:"Loisir", description: "La liste des restaurants").save())
        categories.add(new Category( name:"Restaurant", description: "La liste des restaurants").save())

        //Init POI
        for( Category category in categories ){

            for (int i = 0; i < 10; i++) {
                Poi poi = new Poi(name: "Poi " + category.name + "_" + i, description: "Le poi" + category.name + "_" +i + "!",
                        address: "1645 Route des Lucioles, 06410 Biot",
                        x: 7 + Math.random(), y: 43 + Math.random())
                poi.addToPictures(new Picture(name: "image.png").save())

                category.addToPois(poi)
                category.addToPictures(new Picture(name: "image.png").save())

                testUser.addToPois(poi)
            }
        }


        //Roles
        UserRole.create testAdmin, adminRole, true
        UserRole.create testModo, modoRole, true
        UserRole.create testUser, userRole, true


        /*          Test            */
        //Roles
        assert User.count() == 3
        assert Role.count() == 3
        assert UserRole.count() == 3

        //Categories
        assert Category.count == 5

        //Pois
        assert  Poi.count == 50
    }
    def destroy = {
    }
}
