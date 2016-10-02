<header class="main-header">
    <nav class="navbar navbar-inverse main-nav">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">${grails.util.Metadata.current.getApplicationName()}</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">POI<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Rechercher</a></li>
                            <li><a href="#">Ajouter</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Catégories<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Rechercher</a></li>
                            <li><a href="#">Ajouter</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Utilisateurs<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Rechercher</a></li>
                            <li><a href="#">Ajouter</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifLoggedIn>
                        <li>
                            <g:link controller='login' action='auth'>
                                <span class="glyphicon glyphicon-user"></span>
                                <sec:loggedInUserInfo field='username'/>
                            </g:link>
                        </li>
                        <li>
                             <g:link controller='logout' action='impersonate'>
                                 <span class="glyphicon glyphicon-log-out"></span>Log out
                             </g:link>
                        </li>
                    </sec:ifLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
</header>