
<%@ page import="com.projetpois.poi.Poi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-poi" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list poi">
			
				<g:if test="${poiInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="poi.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${poiInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="poi.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${poiInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="poi.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${poiInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="poi.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${poiInstance?.createdBy?.id}">${poiInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="poi.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${poiInstance?.category?.id}">${poiInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.pictures}">
				<li class="fieldcontain">
					<span id="pictures-label" class="property-label"><g:message code="poi.pictures.label" default="Pictures" /></span>
					
						<g:each in="${poiInstance.pictures}" var="p">
							<img src="${grailsApplication.config.images.pois.url + p.name}">
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.x}">
				<li class="fieldcontain">
					<span id="x-label" class="property-label"><g:message code="poi.x.label" default="X" /></span>
					
						<span class="property-value" aria-labelledby="x-label"><g:fieldValue bean="${poiInstance}" field="x"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${poiInstance?.y}">
				<li class="fieldcontain">
					<span id="y-label" class="property-label"><g:message code="poi.y.label" default="Y" /></span>
					
						<span class="property-value" aria-labelledby="y-label"><g:fieldValue bean="${poiInstance}" field="y"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:poiInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${poiInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
