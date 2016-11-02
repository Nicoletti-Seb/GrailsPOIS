<header class="main-header">
    <nav class="navbar navbar-inverse main-nav">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link class="navbar-brand" controller="app"
                        action="index">${grails.util.Metadata.current.getApplicationName()}</g:link>
            </div>

            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><g:link controller="poi" action="index">POI</g:link></li>
                    <li><g:link controller="category" action="index">Catégories</g:link></li>
                    <li><g:link controller="user" action="index">Utilisateurs</g:link></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifLoggedIn>
                        <li>
                            <!-- Trouver comment afficher les infos de l'utilisateur courant -->
                            <g:link controller='user' action="show" id="${sec.loggedInUserInfo(field:'id')}">
                                <span class="glyphicon glyphicon-user"></span>
                                <sec:loggedInUserInfo field='username'/>
                            </g:link>
                        </li>
                        <li>
                            <g:link controller='logout' action='index'>
                                <span class="glyphicon glyphicon-log-out"></span> Log out
                            </g:link>
                        </li>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <li>
                            <g:link controller='login' action='auth'>
                                <span class="glyphicon glyphicon-log-in"></span> Login
                            </g:link>
                        </li>
                    </sec:ifNotLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
</header>