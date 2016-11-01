<%@ page import="com.projetpois.poi.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="page-header">
        <g:if test="${flash.message}">
            <div class="alert alert-warning alert-dismissible fade in" role="status">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <div class="message" role="status">${flash.message}</div>
            </div>
        </g:if>

        <g:hasErrors bean="${categoryInstance}">
            <div class="alert alert-danger alert-dismissible fade in" role="status">
                <ul class="errors" role="alert">
                    <g:eachError bean="${categoryInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <nav>
            <ol class="breadcrumb">
                <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                                   args="[entityName]"/></g:link></li>
                <li><g:link class="list" action="show" id="${categoryInstance?.id}">
                    <g:if test="${categoryInstance?.name}">
                        <g:fieldValue bean="${categoryInstance}" field="name"/>
                    </g:if>
                    <g:else>
                        <g:message code="category.name.label" default="Category"/>
                    </g:else>
                </g:link></li>
                <li class="active">Edit</li>
            </ol>
        </nav>

        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    </div>

    <div id="edit-category" class="content scaffold-edit" role="main">
        <g:uploadForm class="form-horizontal" url="[resource: categoryInstance, action: 'update']">
            <g:hiddenField name="version" value="${categoryInstance?.version}"/>
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>

            <div class="well">
                <fieldset class="buttons">
                    <div class="col-sm-offset-3 col-sm-9">
                        <g:actionSubmit name="update" class="save btn btn-default btn-primary"
                                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    </div>
                </fieldset>
            </div>
        </g:uploadForm>
    </div>
</div>

    <asset:javascript src="formListener.js"/>
</body>
</html>
