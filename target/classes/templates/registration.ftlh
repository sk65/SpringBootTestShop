<#import "parts/common.ftlh" as c>
<@c.page>
    <h1>Registration</h1>
    <#if message??>
        <h1> ${message}</h1>
    </#if>

    <form action="/registration" method="post">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label"><strong>Email :</strong></label>
            <div class="col-sm-5">
                <input type="text" name="email" class="form-control" placeholder="example@mail.com" id="inputEmail3"/>

            </div>
        </div>

        <div class="form-group row">
            <#if emailError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${emailError}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label"><strong>Password :</strong></label>
            <div class="col-sm-5">
                <input type="password" class="form-control passwordInput" name="password" placeholder="password"
                       id="inputPassword3">
                <input type="checkbox" onclick="showPassword(this)"> Show Password
            </div>
        </div>
        <div class="form-group row">
            <#if passwordError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <div class="form-group row">
            <label for="inputPassword2" class="col-sm-2 col-form-label"><strong>Retype password :</strong></label>
            <div class="col-sm-5">
                <input type="password" class="form-control passwordInput" name="password2" placeholder="retype password"
                       id="inputPassword2">
                <input type="checkbox" onclick="showPassword(this)"> Show Password
            </div>
        </div>
        <div class="form-group row">
            <#if confirmationError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${confirmationError}
                </div>
            </#if>
            <#if password2Error??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${password2Error}
                </div>
            </#if>
        </div>
        <div class="form-group row">
            <label for="inputFirstName" class="col-sm-2 col-form-label"><strong>First Name :</strong></label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="firstName" placeholder="Вася" id="inputFirstName">
            </div>
        </div>
        <div class="form-group row">
            <#if firstNameError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${firstNameError}
                </div>
            </#if>
        </div>
        <div class="form-group row">
            <label for="inputLastName" class="col-sm-2 col-form-label"><strong>Last Name :</strong></label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="lastName" placeholder="Пупкин" id="inputLastName">
            </div>
        </div>
        <div class="form-group row">
            <#if lastNameError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${lastNameError}
                </div>
            </#if>
        </div>

        <div class="form-group row">
            <div class="g-recaptcha col-sm-5" data-sitekey="6LfPjuMZAAAAAFRaF2hpVEBv2T3pyUwIQMHS8TwT"></div>
        </div>
        <div class="form-group row">
            <#if captchaError??>
                <div class="alert alert-danger col-sm-7" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>

        <#--        <div><label> Email :<input type="email" name="email" placeholder="example@mail.com"/> </label></div>-->
        <#--        <div><label> Password: <input type="password" name="password" placeholder="password" id="passwordInput"/>-->
        <#--                <input type="checkbox" onclick="showPassword()"> Show Password-->
        <#--            </label>-->
        <#--        </div>-->
        <#--        <div><label> First name: <input type="text" name="firstName" placeholder="Вася"/> </label></div>-->
        <#--        <div><label> Last name: <input type="text" name="lastName" placeholder="Пупкин"/> </label></div>-->
        <#--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
        <#--        <div><input type="submit" value="registration"/></div>-->
    </form>
</@c.page>

