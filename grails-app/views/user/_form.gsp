<%@ page import="com.projetpois.user.User" %>



<div class="form-group ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
    <label for="mail" class="col-sm-3 control-label">
        <g:message code="user.mail.label" default="Mail"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="mail" class="form-control" required="" value="${userInstance?.mail}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username" class="col-sm-3 control-label">
        <g:message code="user.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:textField name="username" class="form-control" required="" value="${userInstance?.username}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password" class="col-sm-3 control-label">
        <g:message code="user.password.label" default="Password"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <g:field type="password" name="password" class="form-control password" required=""/>
    </div>
</div>

<div class="form-group required">
    <label for="password" class="col-sm-3 control-label">
        Confirm Password
        <span class="required-indicator">*</span>
    </label>

    <div class="col-sm-4">
        <input type="password" class="form-control confirm-password" required=""/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired" class="col-sm-3 control-label">
        <g:message code="user.accountExpired.label" default="Account Expired"/>
    </label>

    <div class="col-sm-4">
        <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked" class="col-sm-3 control-label">
        <g:message code="user.accountLocked.label" default="Account Locked"/>
    </label>

    <div class="col-sm-4">
        <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <label for="enabled" class="col-sm-3 control-label">
        <g:message code="user.enabled.label" default="Enabled"/>
    </label>

    <div class="col-sm-4">
        <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired" class="col-sm-3 control-label">
        <g:message code="user.passwordExpired.label" default="Password Expired"/>
    </label>

    <div class="col-sm-4">
        <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
    </div>
</div>

<div class="form-group">
    <label for="pois" class="col-sm-3 control-label">
        <g:message code="user.pois.label" default="Pois"/>
    </label>

    <div class="col-sm-4">
        <g:link name="pois" class="btn btn-default btn-success" controller="poi" action="create"
                params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'poi.label', default: 'Poi')])}</g:link>
    </div>
</div>

<g:if test="${userInstance?.pois}">
    <div class="form-group ${hasErrors(bean: userInstance, field: 'pois', 'error')} ">
        <div class="col-sm- col-sm-offset-2">
            <table class="table table-striped">
                <thead>
                <tr>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'poi.name.label', default: 'Name')}"/>

                    <g:sortableColumn property="address"
                                      title="${message(code: 'poi.address.label', default: 'Address')}"/>

                    <th><g:message code="poi.category.label" default="Category"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${userInstance.pois}" var="poiInstance">
                    <tr>
                        <td><g:link controller="poi" action="show"
                                    id="${poiInstance.id}">${fieldValue(bean: poiInstance, field: "name")}</g:link></td>

                        <td>${fieldValue(bean: poiInstance, field: "address")}</td>

                        <td><g:link controller="category" action="show" id="${poiInstance.category.id}">
                            ${fieldValue(bean: poiInstance, field: "category.name")}
                        </g:link></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</g:if>

<!--<div class="col-sm-4">
<ul class="one-to-many">
<g:each in="${userInstance?.pois ?}" var="p">
    <li><g:link controller="poi" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add"><g:link controller="poi" action="create"
                        params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'poi.label', default: 'Poi')])}</g:link>
</li>
</ul>
</div>-->

</div>

