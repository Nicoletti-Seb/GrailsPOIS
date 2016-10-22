<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta name="layout" content="main"/>
		<title>POIs App</title>
	</head>
	<body>
		<div class="index-container">
			<!-- Categories -->
			<nav class="navbar nav_category">
				<g:each in="${categories}" var="c">
					<details class="category" data-category="${c.id}">
						<summary class="title-category">${c.name}</summary>
						<ul class="list-pois">
							<g:each in="${c.pois}" var="poi">
								<li class="poi" draggable="true" data-poi="${poi.id}">
									<a href="#">${poi.name}</a>
									<i class="glyphicon glyphicon-screenshot target_marker"></i>
								</li>
							</g:each>
						</ul>
					</details>
				</g:each>

			</nav>
			<!-- map -->
			<div class="map"></div>
		</div>


		<section class="hide panels">
			<!-- Info marker -->
			<section class="info-marker">
				<header class="info-header" >
					<h1 class="title"></h1>
				</header>
				<section class="info-content" >
					<h2 class="address"></h2>
					<p class="description"></p>
				</section>
			</section>
		</section>

		<!-- Scripts -->
		<asset:javascript src="index.js"/>
		<script src="https://maps.googleapis.com/maps/api/js?key=${grailsApplication.config.API_KEY}&callback=initMap"></script>
	</body>
</html>

