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
			<nav class="navbar nav_category">
				<details class="category" >
					<summary class="title-category">Catégorie</summary>
					<ul class="list-pois">
						<li class="poi"><a href="#">Poi 1</a></li>
						<li class="poi"><a href="#">Poi 2</a></li>
						<li class="poi"><a href="#">Poi 3</a></li>
					</ul>
				</details>
				<details class="category" >
					<summary class="title-category">Catégorie2</summary>
					<ul class="list-pois">
						<li class="poi"><a href="#">Poi 1</a></li>
						<li class="poi"><a href="#">Poi 2</a></li>
						<li class="poi"><a href="#">Poi 3</a></li>
					</ul>
				</details>
				<details class="category" >
					<summary class="title-category">Catégorie3</summary>
					<ul class="list-pois">
						<li class="poi"><a href="#">Poi 1</a></li>
						<li class="poi"><a href="#">Poi 2</a></li>
						<li class="poi"><a href="#">Poi 3</a></li>
					</ul>
				</details>
			</nav>
			<div class="map"></div>
		</div>

		<!-- Google Map -->
		<asset:javascript src="index.js"/>
		<script src="https://maps.googleapis.com/maps/api/js?key=${grailsApplication.config.API_KEY}&callback=initMap"></script>
	</body>
</html>

