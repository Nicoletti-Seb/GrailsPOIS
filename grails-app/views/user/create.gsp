<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div id="create-user" class="content scaffold-create" role="main">
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
                    <li class="active"><g:message code="default.create.label"  args="[entityName]"/></li>
                </ol>
            </nav>

            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
        </div>

        <g:form class="form-horizontal" url="[resource: userInstance, action: 'save']">
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>

            <div class="well">
                <fieldset class="buttons">
                    <div class="col-sm-offset-3 col-sm-9">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </div>
                </fieldset>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
