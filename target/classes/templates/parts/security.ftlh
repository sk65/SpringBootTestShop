<#assign
know = Session.SPRING_SECURITY_CONTEXT??
>

<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getFirstName()
    isAdmin = user.isAdmin()
    userAvatar = user.getUserAvatarFile()
    >
<#else >
    <#assign
    name = "unknown"
    isAdmin = false
    userAvatar = "anonim.png"
    >
</#if>