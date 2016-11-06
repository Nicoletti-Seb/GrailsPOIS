<%@ page import="com.projetpois.poi.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h1>
            <g:message code="default.list.label" args="[entityName]"/>

            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">
                <g:link class="create" action="create">
                    <button type="button" class="btn btn-sm btn-primary">
                        <g:message code="default.new.label" args="[entityName]"/>
                    </button>
                </g:link>
            </sec:ifAnyGranted>
        </h1>
    </div>

    <div id="list-category" class="content scaffold-list" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <table class="table table-striped">
            <thead>
            <tr>

                <g:sortableColumn property="name" title="${message(code: 'category.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'category.description.label', default: 'Description')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "name")}</g:link></td>

                    <td>${fieldValue(bean: categoryInstance, field: "description")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${categoryInstanceCount ?: 0}"/>
        </div>
    </div>
</div>
</body>
</html>
