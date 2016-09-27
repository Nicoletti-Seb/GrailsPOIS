import com.projetpois.user.Role
import com.projetpois.user.User
import com.projetpois.user.UserRole

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()
        def moderatorRole = new Role('ROLE_MODERATOR').save()

        def testUser = new User('root', 'azerty@gmail.com', 'root').save()
        UserRole.create testUser, adminRole, true

        assert User.count() == 1
        assert Role.count() == 3
        assert UserRole.count() == 1
    }
    def destroy = {
    }
}
