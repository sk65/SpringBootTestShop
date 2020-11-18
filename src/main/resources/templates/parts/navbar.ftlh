<#include "security.ftlh">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">TestShop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">user</a>
                </li>
            </#if>
        </ul>
        <#if know >
            <div class="row">
                <div class="col-sm ">
                    <img src="/img/${userAvatar}" width="50" height="50">
                </div>
                <div class="col-sm ">
                    <h3><a href="/personalArea">${name}</a></h3>
                </div>
                <div class="col-sm">
                    <form method="post" action="/logout" class="form-inline my-2 my-lg-0">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Out</button>
                    </form>
                </div>
            </div>
        <#else >
            <div class="row">
                <div class="col-sm ">
                    <#if userAvatar??>
                        <img src="/img/${userAvatar}" width="50" height="50">
                    <#else>
                        <p><a href="/personalArea"> <img src="/img/anonim.png" width="50" height="50"></a></p>
                    </#if>
                </div>
                <div class="col-sm ">
                    <h3>Anonim</h3>
                </div>
                <div class="col-sm ">
                    <form method="get" action="/login" class="form-inline my-2 my-lg-0">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign in</button>
                    </form>
                </div>
            </div>

        </#if>
    </div>
</nav>