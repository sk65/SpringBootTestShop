<#import "parts/common.ftlh" as c>

<@c.page>
    <form action="/registration" method="post">
        <div><label> Email : <input type="email" name="email" placeholder="example@mail.com"/> </label></div>
        <div><label> Password: <input type="password" name="password" placeholder="password"/> </label></div>
        <div><label> First name: <input type="text" name="firstName" placeholder="Вася"/> </label></div>
        <div><label> Last name: <input type="text" name="lastName" placeholder="Пупкин"/> </label></div>
        <input type="hidden"  name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div><input type="submit" value="registration"/></div>
    </form>
</@c.page>

