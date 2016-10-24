<%@ page import="com.projetpois.user.User" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<div>
    <div class="container">
        <div id="show-user" class="content scaffold-show" role="main">
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
                            <g:if test="${userInstance?.username}">
                                <g:fieldValue bean="${userInstance}" field="username"/>
                            </g:if>
                        </li>
                    </ol>
                </nav>

                <h1><g:message code="default.show.label" args="[entityName]"/></h1>
            </div>

            <div class="form-horizontal">

                <g:if test="${userInstance?.mail}">
                    <div class="form-group">
                        <label for="mail-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.mail.label" default="Mail"/>
                        </label>

                        <div class="col-sm-4">
                            <g:fieldValue bean="${userInstance}" field="mail"/>
                        </div>
                    </div>
                </g:if>

                <g:if test="${userInstance?.username}">
                    <div class="form-group">
                        <label for="username-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.username.label" default="Username"/>
                        </label>

                        <div class="col-sm-4">
                            <g:fieldValue bean="${userInstance}" field="username"/>
                        </div>
                    </div>
                </g:if>

                <g:if test="${userInstance?.password}">
                    <div class="form-group">
                        <label for="password-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.password.label" default="Password"/>
                        </label>

                        <div class="col-sm-4">
                            <g:fieldValue bean="${userInstance}" field="password"/>
                        </div>
                    </div>
                </g:if>

                <g:if test="${userInstance?.accountExpired}">
                    <div class="form-group">
                        <label for="password-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.accountExpired.label" default="Account Expired"/>
                        </label>

                        <div class="col-sm-4">
                            <g:formatBoolean boolean="${userInstance?.accountExpired}"/>
                        </div>
                    </div>
                </g:if>

                <g:if test="${userInstance?.accountLocked}">
                    <div class="form-group">
                        <label for="password-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.accountLocked.label" default="Account Locked"/>
                        </label>

                        <div class="col-sm-4">
                            <g:formatBoolean boolean="${userInstance?.accountLocked}"/>
                        </div>
                    </div>
                </g:if>

                <g:if test="${userInstance?.enabled}">
                    <div class="form-group">
                        <label for="password-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.enabled.label" default="Enabled"/>
                        </label>

                        <div class="col-sm-4">
                            <g:formatBoolean boolean="${userInstance?.enabled}"/>
                        </div>

                    </div>
                </g:if>

                <g:if test="${userInstance?.passwordExpired}">
                    <div class="form-group">
                        <label for="password-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.passwordExpired.label" default="Password Expired"/>
                        </label>

                        <div class="col-sm-4">
                            <g:formatBoolean boolean="${userInstance?.passwordExpired}"/>
                        </div>

                    </div>
                </g:if>

                <g:if test="${userInstance?.pois}">
                    <div class="form-group">
                        <label for="pois-label" class="col-sm-2 col-sm-offset-3">
                            <g:message code="user.pois.label" default="Pois"/>
                        </label>

                        <g:each in="${userInstance.pois}" var="p">
                            <g:link controller="poi" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link>
                        </g:each>
                    </div>
                </g:if>

            </div>

            <div class="well">
                <g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="btn btn-default" action="edit" resource="${userInstance}"><g:message
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
