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
		<!-- Categories -->
		<div class="index-container">
			<nav class="navbar nav_category">
				<g:each in="${categories}" var="c">
					<details class="category" >
						<summary class="title-category">${c.name}</summary>
						<ul class="list-pois">
							<g:each in="${c.pois}" var="poi">
								<li class="poi"><a href="#">${poi.name}</a></li>
							</g:each>
						</ul>
					</details>
				</g:each>

			</nav>
			<div class="map"></div>
		</div>

		<!-- Google Map -->
		<asset:javascript src="index.js"/>
		<script src="https://maps.googleapis.com/maps/api/js?key=${grailsApplication.config.API_KEY}&callback=initMap"></script>
	</body>
</html>

