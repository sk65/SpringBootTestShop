<#import "parts/common.ftlh" as c>

<@c.page>
    <h1>Something went wrong! </h1>
    <#if status??>
        <h1> ${status}</h1>
    </#if>
    <a href="/">Go Home</a>
</@c.page>
