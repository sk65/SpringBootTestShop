<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">
<#import "parts/pager.ftlh" as p>
<@c.page>
<@p.pager url page/>
<div class="row">
    <div class="col-sm">
        <form method="get" action="/" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" name="filter" placeholder="Search"
                   aria-label="Search"/>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
    <div class="row">
        <div class="card-columns ">
            <#list page.content as product>
            <div class="card my-3">
                <div>
                    <#if product.filename??>
                        <img src="/img/${product.filename}" class="card-img-top"/>
                    <#else >
                        <img src="/img/no-image-icon-6.jpg" class="card-img-top"/>
                    </#if>
                </div>
                <div class="ml-2">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.description}</p>
                    <div class="row mb-2">
                        <div class="col-sm">
                            <h3>${product.price} $</h3>
                        </div>
                        <div class="col-sm float-right">
                            <a href="#" class="btn btn-primary">Buy</a>
                        </div>
                    </div>
                </div>
            </div>
            <#else>
            <div class="row">
                <div class="ml-2">
                    <h1>No products</h1></p>
                    <div>
                    </div>
                    </#list>
                </div>
            </div>
        </div>
        <@p.pager url page/>
        </@c.page>

