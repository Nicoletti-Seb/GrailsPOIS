<%@ page import="com.projetpois.poi.Poi" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="page-header">
        <g:if test="${flash.message}">
            <div class="alert alert-info alert-dismissible fade in" role="status">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <div class="message" role="status">${flash.message}</div>
            </div>
        </g:if>

        <nav>
            <ol class="breadcrumb">
                <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                                   args="[entityName]"/></g:link></li>
                <li class="active">
                    <g:if test="${poiInstance?.name}">
                        <g:fieldValue bean="${poiInstance}" field="name"/>
                    </g:if>
                </li>
            </ol>
        </nav>

        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    </div>

    <div id="show-poi" class="content scaffold-show" role="main">
        <div class="form-horizontal">

            <g:if test="${poiInstance?.name}">
                <div class="form-group">
                    <label for="name-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.name.label" default="Name"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${poiInstance}" field="name"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.address}">
                <div class="form-group">
                    <label for="address-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.address.label" default="Address"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${poiInstance}" field="address"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.description}">
                <div class="form-group">
                    <label for="description-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.description.label" default="Description"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${poiInstance}" field="description"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.createdBy}">
                <div class="form-group">
                    <label for="createdBy-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.createdBy.label" default="Created By"/>
                    </label>

                    <div class="col-sm-4">
                        <g:link controller="user" action="show" id="${poiInstance?.createdBy?.id}">
                            ${poiInstance?.createdBy?.username}
                        </g:link>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.category}">
                <div class="form-group">
                    <label for="category-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.category.label" default="Category"/>
                    </label>

                    <div class="col-sm-4">
                        <g:link controller="category" action="show" id="${poiInstance?.category?.id}">
                            ${poiInstance?.category?.name}
                        </g:link>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.pictures}">
                <div class="form-group">
                    <div class="container_pictures">
                        <g:each in="${poiInstance.pictures}" var="p">
                            <div class="picture_form">
                                <img class="picture" src="${grailsApplication.config.images.pois.url + p.name}">
                            </div>
                        </g:each>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.x}">
                <div class="form-group">
                    <label for="x-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.x.label" default="X"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${poiInstance}" field="x"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${poiInstance?.y}">
                <div class="form-group">
                    <label for="y-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="poi.y.label" default="Y"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${poiInstance}" field="y"/>
                    </div>
                </div>
            </g:if>

            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">
                <div class="well">
                    <g:form url="[resource: poiInstance, action: 'delete']" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="btn btn-default" action="edit" resource="${poiInstance}"><g:message
                                    code="default.button.edit.label" default="Edit"/></g:link>
                            <g:actionSubmit class="btn btn-default" action="delete"
                                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                        </fieldset>
                    </g:form>
                </div>
            </sec:ifAnyGranted>
        </div>
    </div>
</div>
</body>
</html>
