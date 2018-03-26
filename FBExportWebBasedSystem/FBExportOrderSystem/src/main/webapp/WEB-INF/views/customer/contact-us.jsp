<div class="container" style="margin-top:10px;">

    <!--Section: Contact v.1-->
    <section id="contact" class="section mb-4">

        <div class="text-center">
        <!--Section heading-->
        <h1 class="section-heading mt-5 pt-4 wow fadeIn" data-wow-delay="0.2s">Contact us</h1>
        <!--Section description-->
        <p class="section-description mb-5 pb-5 wow fadeIn" data-wow-delay="0.2s">Contact us to provide you with more information, answer any questions you may have and create an effective solution for your instructional needs.</p>

        </div>

        <div class="row">

            <!--First column-->
            <div class="col-lg-5 col-md-12  mb-4 pb-4 wow fadeIn" data-wow-delay="0.4s">

                <!--Form with header-->


                    <div class="card-body">
                    	<form action="/contact-us-email" id="contactForm" method="post">
	                        <!--Header-->
	                        <div class="form-header cyan-3-color">
	                            <h3><i class="fa fa-envelope"></i> Write to us:</h3>
	                        </div>
	
	                        <p>We'll write rarely, but only the best content.</p>
	                        <br>
	
	                        <!--Body-->
	                        <div class="md-form">
	                            <i class="fa fa-user prefix"></i>
	                            <input type="text" id="contactName" name="contactName" class="form-control">
	                            <label for="contactName">Your name</label>
	                        </div>
	
	                        <div class="md-form">
	                            <i class="fa fa-envelope prefix"></i>
	                            <input type="email" id="contactEmail" name="contactEmail" class="form-control">
	                            <label for="contactEmail">Your email</label>
	                        </div>
	
	                        <div class="md-form">
	                            <i class="fa fa-tag prefix"></i>
	                            <input type="text" id="contactSubject" name="contactSubject" class="form-control">
	                            <label for="contactSubject">Subject</label>
	                        </div>
	
	                        <div class="md-form">
	                            <i class="fa fa-pencil prefix"></i>
	                            <textarea type="text" id="contactMessage" name="contactMessage" class="md-textarea"></textarea>
	                            <label for="contactMessage">Message</label>
	                        </div>
	
	                        <div class="text-center">
	                        <button class="btn btn-default light-blue lighten-2" id="contact-us-submit" type="submit">
	                            Submit
	                        </button>

	                        </div>
							<img class="sending-email mx-auto" style="display:none;" src="/FBExportSystem/resources/customer/img/loader.gif" height="50" width="50">
								                        
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                        </form>

                    </div>


                <!--/Form with header-->

            </div>
            <!--/First column-->

            <!--Second column-->
            <div class="col-lg-7 col-md-12 wow fadeIn" data-wow-delay="0.4s">

                <!--Google map-->
                <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3862.576314175221!2d121.00400131483937!3d14.508994989860893!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397ceb94a18e9bb%3A0xa0954ead731062d4!2s9474+Alejandro%2C+Para%C3%B1aque%2C+1705+Metro+Manila!5e0!3m2!1sen!2sph!4v1515423095244" frameborder="0" style="border:0; height: 400px;" class="z-depth-1-half map-container " ></iframe>
                </div>
                <br>
                <!--Buttons-->
                <div class="row text-center">
                    <div class="col-md-4">
                        <a class="btn-floating btn-cyan-3  btn-cyan-3"><i class="fa fa-map-marker"></i></a>
                        <p>9474 A Alejandro St Paranaque City </p>
                        <p>Metro Manila - Philippines</p>


                    </div>

                    <div class="col-md-4">
                        <a class="btn-floating btn-cyan-3  btn-cyan-3"><i class="fa fa-phone"></i></a>
                        <p>+ 01 234 567 89</p>
                        <p>Mon - Fri, 8:00AM-5:00PM</p>
                    </div>

                    <div class="col-md-4">
                        <a class="btn-floating btn-cyan-3  btn-cyan-3"><i class="fa fa-envelope"></i></a>
                        <p>fongbrosinc@gmail.com</p>
                    </div>
                </div>

            </div>
            <!--/Second column-->

        </div>

    </section>
    <!--/Section: Contact v.1-->
</div>