<#import "parts/common.ftlh" as c>
<@c.page>
    <h1>User editor</h1>
    <form action="/user" method="post">
        <input type="text" name="email" value="${user.email}">
        <#list roles as role>
            <div>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>

        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit"><strong>Save</strong></button>
    </form>
</@c.page>