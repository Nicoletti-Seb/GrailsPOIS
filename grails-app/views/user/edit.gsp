<%@ page import="com.projetpois.user.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
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

        <g:hasErrors bean="${userInstance}">
            <div class="alert alert-danger alert-dismissible fade in" role="status">
                <ul class="errors" role="alert">
                    <g:eachError bean="${userInstance}" var="error">
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
                <li><g:link class="list" action="show" id="${userInstance?.id}">
                    <g:if test="${userInstance?.username}">
                        <g:fieldValue bean="${userInstance}" field="username"/>
                    </g:if>
                    <g:else>
                        <g:message code="user.username.label" default="Username"/>
                    </g:else>
                </g:link></li>
                <li class="active">Edit</li>
            </ol>
        </nav>

        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    </div>

    <div id="edit-user" class="content scaffold-edit" role="main">
        <g:form class="form-horizontal" url="[resource: userInstance, action: 'update']" method="PUT">
            <g:hiddenField name="version" value="${userInstance?.version}"/>
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>

            <div class="well">
                <fieldset class="buttons">
                    <div class="col-sm-offset-3 col-sm-9">
                        <g:actionSubmit class="save btn btn-default btn-primary" action="update"
                                        value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    </div>
                </fieldset>
            </div>
        </g:form>
    </div>
</div>
<asset:javascript src="formListener.js"/>
</body>
</html>
