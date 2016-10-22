
<%@ page import="com.projetpois.poi.Poi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-poi" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'poi.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'poi.address.label', default: 'Address')}" />
					
						<th><g:message code="poi.createdBy.label" default="Created By" /></th>

						<th><g:message code="poi.category.label" default="Category" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${poiInstanceList}" status="i" var="poiInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${poiInstance.id}">${fieldValue(bean: poiInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: poiInstance, field: "address")}</td>
					
						<td><g:link controller="user" action="show" id="${poiInstance.createdBy.id}">
							${fieldValue(bean: poiInstance, field: "createdBy.username")}
						</g:link></td>
					
						<td><g:link controller="category" action="show" id="${poiInstance.category.id}">
							${fieldValue(bean: poiInstance, field: "category.name")}
						</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${poiInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
