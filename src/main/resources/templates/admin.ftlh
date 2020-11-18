<#import "parts/common.ftlh" as c>

<@c.page>
    <div>
        <h1>Hello admin</h1>
        <div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="submit" value="Sign Out">
            </form>
        </div>

    </div>
</@c.page>

