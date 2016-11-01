import com.projetpois.CategoryService
import com.projetpois.RoleService
import com.projetpois.UserService
import com.projetpois.picture.Picture
import com.projetpois.poi.Category
import com.projetpois.poi.Poi
import com.projetpois.user.Role
import com.projetpois.user.User
import com.projetpois.user.UserRole

class BootStrap {

    RoleService roleService
    UserService userService
    CategoryService categoryService

    def init = { servletContext ->

        //Roles
        /*Role adminRole = new Role('ROLE_ADMIN').save()
        Role userRole = new Role('ROLE_USER').save()
        Role modoRole = new Role('ROLE_MODERATOR').save()*/
        Role adminRole = roleService.createRole(authority: 'ROLE_ADMIN')
        Role userRole = roleService.createRole(authority: 'ROLE_USER')
        Role modoRole = roleService.createRole(authority: 'ROLE_MODERATOR')

        //User
        /*User testAdmin = new User('root', 'root@gmail.com', 'root').save()
        User testModo = new User('modo', 'modo@gmail.com', 'modo').save()
        User testUser = new User('user', 'user@gmail.com', 'user').save()*/
        User testUser = userService.createUser(username: 'user', mail: 'user@gmail.com', password: 'user', role: userRole)
        User testModo = userService.createUser(username: 'modo', mail: 'modo@gmail.com', password: 'modo', role: modoRole)
        User testAdmin = userService.createUser(username: 'root', mail: 'root@gmail.com', password: 'root', role: adminRole)

        //Category
        categoryService.createCategory(name: "Cinema", description: "La liste des cinemas", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Magasin", description: "La liste des magasins", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Touristique", description: "La liste des lieux touristiques", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Loisir", description: "La liste des loisirs", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Restaurant", description: "La liste des restaurants", image_name: "image.png", nb_pois: 10, user: testUser)

        //Init Category
        /*List<Category> categories = new ArrayList<>()
        categories.add(new Category( name:"Cinema", description: "La liste des cinemas").save())
        categories.add(new Category( name:"Magasin", description: "La liste des magasins").save())
        categories.add(new Category( name:"Touristique", description: "La liste des lieux touristiques").save())
        categories.add(new Category( name:"Loisir", description: "La liste des loisirs").save())
        categories.add(new Category( name:"Restaurant", description: "La liste des restaurants").save())

        //Init POI
        for( Category category in categories ){
            category.addToPictures(new Picture(name: "image.png").save())
            for (int i = 0; i < 10; i++) {
                Poi poi = new Poi(name: "Poi " + category.name + "_" + i, description: "Le poi" + category.name + "_" +i + "!",
                        address: "1645 Route des Lucioles, 06410 Biot",
                        x: 0 + Math.random()*5, y: 45 + Math.random()*5)
                poi.addToPictures(new Picture(name: "image.png").save())

                category.addToPois(poi)
                testUser.addToPois(poi)
            }
        }


        //Roles
        UserRole.create testAdmin, adminRole
        UserRole.create testModo, modoRole
        UserRole.create testUser, userRole, true*/


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
