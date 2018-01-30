<div class = "container p-4">
    <form method = "POST" id="uploadForm">

        <div class = "row">
            <div class = "col">
                <h1> Sign Up </h1>
            </div>


        </div>

        <hr />

        <div class = "row">
            <div class = "col-md-12">

                <fieldset>
                    <legend> Login details </legend>

                        <div class = "row mt-3 justify-content-md-center">

                            <div class="col-md-3 text-center">

                            <img class = "mb-2 rounded" style = "border: 1px solid #DDDDDD;" id='img-upload' src = "profile-male.jpg" width = "150" height = "150" />

                            <p class="file">
                                <input type="file" name="file" id="file" accept="image/x-png,image/jpeg" />
                                <label for="file">Upload your image</label>
                            </p>
                            </div>

                            <div class = "col-md-6">
                                <div class="md-form form-sm">
                                    <input type="text" id="username" class="form-control" length = "20" required />
                                    <label for="username" class="">Username</label>
                                </div>
                                <div class="md-form form-sm">
                                    <input type="password" id="password" class="form-control" length = "20" required />
                                    <label for="password" class="">Password</label>
                                </div>
                            </div>



                        </div>

                </fieldset>

            </div>
        </div>

        <div class = "row">
            <div class = "col-md-12">
                <fieldset>
                    <legend> Basic information </legend>

                    <div class = "row mt-3">
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="text" id="firstname" class="form-control" required />
                                    <label for="firstname" class="">First Name</label>
                                </div>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="text" id="middlename" class="form-control" required />
                                    <label for="middlename" class="">Middle Name</label>
                                </div>
                            </div>
                            <div class = "col-md-4">
                                <div class="md-form form-sm">
                                    <input type="text" id="lastname" class="form-control" required />
                                    <label for="lastname" class="">Last Name</label>
                                </div>
                            </div>
                        </div>

                    <div class = "row">

                        <div class = "col-md-1">
                            <label> Gender: </label>
                        </div>

                        <div class = "col-md-5 form-inline mb-2">

                            <div class="form-group form-sm">
                                <input class = "mr-2" name="gender" value="Male" type="radio" class="with-gap" id="male" required />
                                <label for="male"> Male </label>
                            </div>

                            <div class="form-group form-sm">
                                <input class = "mr-2" name="gender" value="Female" type="radio" class="with-gap" id="female" />
                                <label for="female"> Female </label>
                            </div>

                        </div>

                    </div>

                    <div class = "row mt-3">
                        <div class = "col-md-1">
                            <label class = "mt-2" for = "age"> Age: </label>
                        </div>

                        <div class = "col-md-11 form-inline mb-2">

                            <div class="form-group form-sm">
                                <input  name="group2" type="number" class="with-gap" placeholder="your age" id = "age" required />
                            </div>

                        </div>

                    </div>

                </fieldset>
            </div>
        </div>



        <div class = "row mt-4">
            <div class = "col-md">
                <fieldset>
                    <legend> Address information </legend>


                    <div class = "row mt-3" style = "height: 50px;">
                        <div class = "col-md-7">

                            <div class = "form-inline">
                                    <label for = "country" class = "mr-3"> Country: </label>
                                    <select class="browser-default" id = "country" required>
                                        <option value="" disabled selected>Choose your country</option>
                                    </select>
                            </div>

                        </div>
                        <div class = "col-md-5">

                            <div class="md-form form-sm" style = "position: relative; top: -20px;">
                                <input type="text" id="city" class="form-control" required disabled/>
                                <label for="city" class="">city</label>
                            </div>

                        </div>
                    </div>

                    <div class = "row">
                        <div class = "col-md-7">
                            <div class="md-form form-sm mt-3">

                                <textarea type="text" id="address" class="md-textarea" required></textarea>
                                <label for="address">Address</label>

                            </div>

                        </div>
                        <div class = "col-md-5">
                            <div class="md-form form-sm" style = "margin-top: 75px;">
                                <input type="text" id="zipcode" class="form-control" required />
                                <label for="zipcode">Zip Code</label>
                            </div>
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>

            <div class = "row">
            <div class = "col-md-12">
                <fieldset>
                    <legend> Contact Information </legend>

                        <div class = "row">

                            <div class = "col-md-2 mt-4">

                                        <select class="browser-default" id = "countryCode" required>
                                            <option value="" disabled selected>Country Code</option>
                                        </select>

                            </div>
                            <div class = "col-md-5 mt-1">

                                <div class="md-form form-sm">
                                        <input type="text" id="phonenumber" class="form-control" required />
                                        <label for="phonenumber" class="">Phone Number</label>
                                </div>
                            </div>

                                <div class = "col-md-5 mt-1">
                                <div class="md-form form-sm">
                                        <input type="text" id="email" class="form-control" required />
                                        <label for="email" class="">Email Address</label>
                                </div>
                            </div>

                        </div>

                </fieldset>
            </div>
        </div>

        <div class = "row">
            <div class = "col-md-12">
                <fieldset>
                    <legend> Verify </legend>
                        <div class = "row">
                            <div class = "col-md-12">
                            <div class="g-recaptcha" data-sitekey="6LcmST4UAAAAADNKoDoTOVJIVugq5Fu7kh1KQXV6"></div>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>

        <div class = "row">
            <div class = "col-md-12">
                <input type="submit" class="btn btn-primary" value = "Submit" style = "margin-left: 0px;"/>
            </div>
        </div>

    </form>

</div> 