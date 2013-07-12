<%inherit file="base_login.mako"/>
<div class="middle">
    <div class="form_login">
        <div class="head_login">Register</div>

        <form method="post" action="/register">
            % if message == None and error != None:
                <p style="color: red">${error}</p>
            % elif message != None and error == None:
                <p style="color: green">${message}</p>
            % endif
            <input class="input_text" type="text" value="login" name="login"/>
            <input class="input_text" type="password" value="password" name="password"/>
            <input class="input_text" type="password" value="confirm_password" name="confirm_password"/>
            <button class="btn btn-primary" type=submit>Register</button>
        </form>
    </div>
</div>