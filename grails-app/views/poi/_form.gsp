<%@ page import="com.projetpois.poi.Poi" %>



<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="poi.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${poiInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="poi.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${poiInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="poi.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${poiInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="poi.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.projetpois.user.User.list()}" optionKey="id" required="" value="${poiInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="poi.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.projetpois.poi.Category.list()}" optionKey="id" required="" value="${poiInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'pictures', 'error')} ">
	<label for="pictures">
		<g:message code="poi.pictures.label" default="Pictures" />
		
	</label>
	<g:select name="pictures" from="${com.projetpois.picture.Picture.list()}" multiple="multiple" optionKey="id" size="5" value="${poiInstance?.pictures*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'x', 'error')} required">
	<label for="x">
		<g:message code="poi.x.label" default="X" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="x" type="number" value="${poiInstance.x}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: poiInstance, field: 'y', 'error')} required">
	<label for="y">
		<g:message code="poi.y.label" default="Y" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="y" type="number" value="${poiInstance.y}" required=""/>

</div>

