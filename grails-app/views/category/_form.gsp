<%@ page import="com.projetpois.poi.Category" %>



<div class="form-group ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-3 control-label">
        <g:message code="category.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="name" class="form-control" required="" value="${categoryInstance?.name}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: categoryInstance, field: 'description', 'error')} required">
    <label for="description" class="col-sm-3 control-label">
        <g:message code="category.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="description" class="form-control" required="" value="${categoryInstance?.description}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: categoryInstance, field: 'pictures', 'error')} ">
    <label for="pictures" class="col-sm-3 control-label">
        <g:message code="category.pictures.label" default="Pictures"/>
    </label>
    <input type="file" name="uploadFile"/>
</div>

<div class="container_pictures">
    <g:each in="${categoryInstance.pictures}" var="c">
        <div class="picture_form">
            <span class="btn_delete_picture glyphicon glyphicon-remove"></span>
            <img class="picture" src="${grailsApplication.config.images.categories.url + c.name}">
        </div>
    </g:each>
</div>

<div class="form-group ${hasErrors(bean: categoryInstance, field: 'pois', 'error')} ">
    <label for="pois" class="col-sm-3 control-label">
        <g:message code="category.pois.label" default="Pois"/>
    </label>

    <div class="col-sm-4">
        <ul class="one-to-many">
            <g:each in="${categoryInstance?.pois ?}" var="p">
                <li><g:link controller="poi" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
            </g:each>
            <li class="add">
                <g:link controller="poi" action="create"
                        params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'poi.label', default: 'Poi')])}</g:link>
            </li>
        </ul>
    </div>
</div>

