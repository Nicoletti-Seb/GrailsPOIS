import com.projetpois.poi.Category
import com.projetpois.user.Role
import com.projetpois.user.User
import com.projetpois.user.UserRole

class BootStrap {

    def init = { servletContext ->

        //Roles
        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def moderatorRole = new Role('ROLE_MODERATOR').save()

        //User
        def testUser = new User('root', 'azerty@gmail.com', 'root').save()
        UserRole.create testUser, adminRole


        //Init Category
        new Category( name:"Cinema", description: "La liste des cinemas").save()
        new Category( name:"Magasin", description: "La liste des magasins").save()
        new Category( name:"Touristique", description: "La liste des lieux touristiques").save()
        new Category( name:"Loisir", description: "La liste des restaurants").save()
        new Category( name:"Restaurant", description: "La liste des restaurants").save(flush: true)

        /*          Test            */

        //Roles
        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1

        //Categories
        assert Category.count == 5
    }
    def destroy = {
    }
}
