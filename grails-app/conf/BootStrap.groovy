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
        Role adminRole = roleService.createRole(authority: 'ROLE_ADMIN')
        Role userRole = roleService.createRole(authority: 'ROLE_USER')
        Role modoRole = roleService.createRole(authority: 'ROLE_MODERATOR')

        //User
        User testUser = userService.createUser(username: 'user', mail: 'user@gmail.com', password: 'user', role: userRole)
        User testModo = userService.createUser(username: 'modo', mail: 'modo@gmail.com', password: 'modo', role: modoRole)
        User testAdmin = userService.createUser(username: 'root', mail: 'root@gmail.com', password: 'root', role: adminRole)

        //Category
        categoryService.createCategory(name: "Cinema", description: "La liste des cinemas", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Magasin", description: "La liste des magasins", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Touristique", description: "La liste des lieux touristiques", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Loisir", description: "La liste des loisirs", image_name: "image.png", nb_pois: 10, user: testUser)
        categoryService.createCategory(name: "Restaurant", description: "La liste des restaurants", image_name: "image.png", nb_pois: 10, user: testUser)

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
