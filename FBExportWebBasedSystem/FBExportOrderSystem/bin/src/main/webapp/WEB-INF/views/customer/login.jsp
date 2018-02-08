<div class = "container p-5">

    <div class = "row">
        <div class = "col-md-12">
            <fieldset>
                <legend> Login </legend>

                <hr />

                    <form method = "POST" action = "/login" class = "mt-5 mb-5 ml-5" id = "loginForm">
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "username-email"> Username / Email: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="text" name = "username" id="username-email" class="form-control" data-toggle="tooltip" data-placement="right" title="Enter your username or email" required>
                                    <label for="username-email">Username or email</label>
                                </div>
                            </div>
                        </div>
                        <div class = "row">
                            <div class = "col-md-2 mt-3">
                                <label for = "password"> Password: </label>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="password" name = "password" id="password" class="form-control" data-toggle="tooltip" data-placement="right" title="Your password" required>
                                    <label for="password">password</label>
                                </div>
                            </div>
                        </div>

                        <div class = "row mt-2">
                            <div class = "col-md-12">
                                <div style = "position: relative; left: 80px; font-size: 14px;">
                                    <p> <span class = "blue-text"> Forgot password? </span> / Not registered? <span class = "blue-text"> Sign up </span> </p>
                                </div>
                            </div>
                        </div>

                        <div class = "row">
                            <div class = "col-md-1" style = "position: relative; left: 375px;">
                                <input type="submit" class="btn btn-primary" value = "Login" />
                            </div>
                        </div>
                        
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></strong>

                    </form>

                    <hr />

            </fieldset>
        </div>
    </div>
</div>   
