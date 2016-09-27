import com.projetpois.user.Role
import com.projetpois.user.User

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()

        def testUser = new User('root', 'azerty@gmail.com', 'root').save()


        assert User.count() == 1
        assert Role.count() == 2
    }
    def destroy = {
    }
}
