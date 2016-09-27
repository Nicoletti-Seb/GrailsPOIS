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
        Role moderatorRole = new Role('ROLE_MODERATOR').save()

        //User
        User testUser = new User('root', 'azerty@gmail.com', 'root').save()

        //Init Category
        List<Category> categories = new ArrayList<>()
        categories.add(new Category( name:"Cinema", description: "La liste des cinemas").save())
        categories.add(new Category( name:"Magasin", description: "La liste des magasins").save())
        categories.add(new Category( name:"Touristique", description: "La liste des lieux touristiques").save())
        categories.add(new Category( name:"Loisir", description: "La liste des restaurants").save())
        categories.add(new Category( name:"Restaurant", description: "La liste des restaurants").save())

        //Init POI
        for( Category category in categories ){
            Poi poi = new Poi( name: "Poi " + categories.name, description: "Le poi" + categories.name + "!",
                            address: "1645 Route des Lucioles, 06410 Biot",
                            x: 7 + Math.random(), y: 43 + Math.random())
            category.addToPois(poi);
            testUser.addToPois(poi)
        }


        //Roles
        UserRole.create testUser, adminRole, true

        /*          Test            */
        //Roles
        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1

        //Categories
        assert Category.count == 5

        //Pois
        assert  Poi.count == 5
    }
    def destroy = {
    }
}
