<#import "parts/common.ftlh" as c>
<@c.page>
    <h1>List of users</h1>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.firstName}</td>
                <td> <#list user.roles as role>${role}<#sep>,</#list></td>
                <td><a href="/user/${user.id}">edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>