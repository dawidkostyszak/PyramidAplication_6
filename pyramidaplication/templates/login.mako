<%inherit file="base_login.mako"/>
<div class="middle">
    <div class="form_login">
        <div class="head_login">Login in</div>
        <form method="post" action="/login">
            %if renderer.is_error:
                % for error in renderer.all_errors():
                    <p style="color: red">${error}</p>
                % endfor
            % endif
            <div class="input_text"><p>Login: </p>${renderer.text("login")}</div>
            <div class="input_text"><p>Password: </p>${renderer.password("password")}</div>
            ${renderer.submit("submit", "Login")}
        </form>
    </div>
</div>
