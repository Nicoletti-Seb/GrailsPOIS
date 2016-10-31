<%@ page import="com.projetpois.poi.Poi" %>



<div class="form-group ${hasErrors(bean: poiInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-3 control-label">
        <g:message code="poi.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="name" class="form-control" required="" value="${poiInstance?.name}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'address', 'error')} required">
    <label for="address" class="col-sm-3 control-label">
        <g:message code="poi.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="address" class="form-control" required="" value="${poiInstance?.address}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'description', 'error')} required">
    <label for="description" class="col-sm-3 control-label">
        <g:message code="poi.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="description" class="form-control" required="" value="${poiInstance?.description}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'createdBy', 'error')} required">
    <label for="createdBy" class="col-sm-3 control-label">
        <g:message code="poi.createdBy.label" default="Created By"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:select class="form-control" id="createdBy" name="createdBy.id" from="${com.projetpois.user.User.list()}"
                  optionKey="id"
                  required=""
                  value="${poiInstance?.createdBy?.id}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'category', 'error')} required">
    <label for="category" class="col-sm-3 control-label">
        <g:message code="poi.category.label" default="Category"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:select class="form-control" id="category" name="category.id" from="${com.projetpois.poi.Category.list()}"
                  optionKey="id"
                  required=""
                  value="${poiInstance?.category?.id}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'x', 'error')} required">
    <label for="x" class="col-sm-3 control-label">
        <g:message code="poi.x.label" default="X"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="x" class="form-control" type="number" pattern="[0-9]+,[0-9]+" step="any" value="${(int)poiInstance.x}" required=""/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'y', 'error')} required">
    <label for="y" class="col-sm-3 control-label">
        <g:message code="poi.y.label" default="Y"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field name="y" class="form-control" type="number" pattern="[0-9]+,[0-9]+" step="any" value="${(int)poiInstance.y}" required=""/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: poiInstance, field: 'pictures', 'error')} ">
    <label for="pictures" class="col-sm-3 control-label">
        <g:message code="poi.pictures.label" default="Pictures"/>
    </label>
    <input type="file" name="uploadFile"/>
</div>

<div class="container_pictures">
    <g:each in="${poiInstance.pictures}" var="p">
        <div class="picture_form">
            <span class="btn_delete_picture glyphicon glyphicon-remove"></span>
            <img class="picture" src="${grailsApplication.config.images.pois.url + p.name}">
        </div>
    </g:each>
</div>

