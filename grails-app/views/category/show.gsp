<%@ page import="com.projetpois.poi.Category" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
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
                    <g:if test="${categoryInstance?.name}">
                        <g:fieldValue bean="${categoryInstance}" field="name"/>
                    </g:if>
                </li>
            </ol>
        </nav>

        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    </div>

    <div id="show-category" class="content scaffold-show" role="main">
        <div class="form-horizontal">

            <g:if test="${categoryInstance?.name}">
                <div class="form-group">
                    <label for="name-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="category.name.label" default="Name"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${categoryInstance}" field="name"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${categoryInstance?.description}">
                <div class="form-group">
                    <label for="description-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="category.description.label" default="Description"/>
                    </label>

                    <div class="col-sm-4">
                        <g:fieldValue bean="${categoryInstance}" field="description"/>
                    </div>
                </div>
            </g:if>

            <g:if test="${categoryInstance?.pictures}">
                <div class="form-group">
                    <div class="container_pictures">
                        <g:each in="${categoryInstance.pictures}" var="p">
                            <div class="picture_form">
                                <img class="picture" src="${grailsApplication.config.images.categories.url + p.name}">
                            </div>
                        </g:each>
                    </div>
                </div>
            </g:if>

            <g:if test="${categoryInstance?.pois}">
                <div class="form-group">
                    <label for="pois-label" class="col-sm-2 col-sm-offset-3">
                        <g:message code="category.pois.label" default="Pois"/>
                    </label>

                    <div class="col-sm-4">
                        <ul>
                            <g:each in="${categoryInstance.pois}" var="p">
                                <li>
                                    <span class="property-value" aria-labelledby="pois-label">
                                    <g:link controller="poi" action="show" id="${p.id}">${p?.name}</g:link>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </g:if>


            <div class="well">
                <g:form url="[resource: categoryInstance, action: 'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="btn btn-default" action="edit" resource="${categoryInstance}"><g:message
                                code="default.button.edit.label" default="Edit"/></g:link>
                        <g:actionSubmit class="btn btn-default" action="delete"
                                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </fieldset>
                </g:form>
            </div>
        </div>
        </div>
</body>
</html>
