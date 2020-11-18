<#import "parts/common.ftlh" as c>

<@c.page>
    <#if message??>
        <h1>${message}</h1>
    </#if>
    <form action="/addFile" method="post" enctype="multipart/form-data">
        <p>Upload picture file</p>
        <p><input type="file" name="file"></p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="add file">
    </form>
    <div>
        <#if user.userAvatarFile?has_content>
            <img src="/img/${user.userAvatarFile}">
        </#if>

    </div>
</@c.page>
