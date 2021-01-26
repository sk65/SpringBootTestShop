<#macro login path>
    <#if error??>
        <div class="alert alert-danger" role="alert">
            Bad credentials
        </div>
    </#if>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="email" name="username" placeholder="example@mail.com"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="passwordInput" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input type="password" class="passwordInput" name="password" placeholder="password" id="passwordInput"/>
                <input type="checkbox" onclick="showPassword(this)"/> Show Password
            </div>
        </div>
        <div class="form-group row">
            <label for="remember-me" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <input type="checkbox" name="remember-me" id="remember-me"/> remember me
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-8 ">
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>

</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>