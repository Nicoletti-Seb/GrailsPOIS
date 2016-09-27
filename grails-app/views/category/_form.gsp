<%@ page import="com.projetpois.poi.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="category.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${categoryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="category.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${categoryInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'pictures', 'error')} ">
	<label for="pictures">
		<g:message code="category.pictures.label" default="Pictures" />
		
	</label>
	<g:select name="pictures" from="${com.projetpois.picture.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${categoryInstance?.pictures*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'pois', 'error')} ">
	<label for="pois">
		<g:message code="category.pois.label" default="Pois" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.pois?}" var="p">
    <li><g:link controller="poi" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="poi" action="create" params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'poi.label', default: 'Poi')])}</g:link>
</li>
</ul>


</div>

