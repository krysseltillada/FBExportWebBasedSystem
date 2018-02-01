  <main>

    <div class = "container mt-4">

        <div class = "row">
            <div class = "col-sm-3">
                <h4 class = "pt-3">
                    Shipping
                    <i class="fa fa-ship ml-2" aria-hidden="true"></i>
                </h4>
            </div>
            <div class = "col-9">
                <form class = "form-inline float-right">
                    <input type="text" id="form1" class="form-control m-0 p-0" placeholder = "Order id">
                    <button type="button" class="btn btn-primary pt-2 pb-2 pl-4 pr-4">Search</button>
                </form>
            </div>
        </div>


        <hr class = "mt-1" />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="#" class="list-group-item active">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addreses
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>

                </div>

            </div>

            <div class="col-lg-9">

                <div class="row">

                    <div class="col-md-12">

                        <div class = "row">
                            <div class = "col">

                                <div>
                                    <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                                        data-toggle="collapse" href="#shippingInformationCollapseItem " role="button" aria-expanded="false" aria-controls="shippingInformationCollapseItem" style = "cursor: pointer;"></i>
                                    <span class = "h5-responsive"> <strong> Shipping information </strong> </span>
                                    <span class = "float-right" style = "font-size: 16px;">
                                        <i class="fa fa-print" aria-hidden="true"></i>
                                        <a class = "blue-text" href = "#"> Print </a>
                                    </span>
                                </div>

                                <hr class = "mt-1" />

                                <div class="collapse.show multi-collapse" id="shippingInformationCollapseItem">

                                    <div class = "row no-gutters">
                                        <div class = "col-lg-8">
                                            <strong> Address <i class="fa fa-address-book-o" aria-hidden="true"></i> : Rivera compound saint joseph subdivision pulang lupa 2 </strong>
                                        </div>
                                        <div class = "col-lg-4">
                                            <strong> Zipcode <i class="fa fa-home" aria-hidden="true"></i> : 1742 </strong>
                                        </div>
                                    </div>
                                    <div class = "row no-gutters">
                                        <div class = "col-lg-8">
                                            <strong> Country <i class="fa fa-globe" aria-hidden="true"></i> : Phillipines </strong>
                                        </div>
                                        <div class = "col-lg-4">
                                            <strong> City <i class="fa fa-map" aria-hidden="true"></i> : Las pinas city </strong>
                                        </div>
                                    </div>
                                    <div class = "row no-gutters">
                                        <div class = "col-lg-8">
                                            <strong> Shipment status : On Cargo Ship <i class="fa fa-ship" aria-hidden="true"></i> </strong>
                                        </div>
                                        <div class = "col-lg-4">
                                            <strong> Your Phone number <i class="fa fa-mobile-phone" aria-hidden="true"></i> : 09151829105 </strong>
                                        </div>
                                    </div>
                                    <div class = "row no-gutters">
                                        <div class = "col-lg-8">
                                            <strong> Departure : November 11 2018 </strong>
                                        </div>
                                        <div class = "col-lg-4">
                                            <strong> Arrival : November 30 2018 </strong>
                                        </div>
                                    </div>

                                    <br />

                                    <div>
                                        <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                                            data-toggle="collapse" href="#vesselStatusCollapseItem " role="button" aria-expanded="false" aria-controls="vesselStatusCollapseItem" style = "cursor: pointer;"></i>
                                        <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
                                        <span class = "float-right" style = "font-size: 16px;">
                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                                            <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
                                        </span>
                                    </div>

                                    <hr class = "mt-1" />

                                    <div class="collapse multi-collapse" id="vesselStatusCollapseItem">

                                        <div class = "row no-gutters">
                                            <div class = "col-md-8">
                                                <strong> Vessel name: AQUA JEWEL </strong>
                                            </div>
                                            <div class = "col-md-4">
                                                <strong> IMO Number: 8976671</strong>
                                            </div>
                                        </div>

                                        <div class = "row no-gutters">
                                            <div class = "col-md-8">
                                                <strong> MMSI Number: 239981000 </strong>
                                            </div>
                                                <div class = "col-md-4">
                                                <strong> Destination: Madagascar </strong>
                                            </div>
                                        </div>

                                    

                                        <hr class = "mt-1" />

                                        <div class = "row">

                                            <div class = "col">

                                                <iframe name="marinetraffic" id="marinetraffic" width="100%" height="450" scrolling="no" frameborder="0"
                                                        src="http://www.marinetraffic.com/en/ais/embed/zoom:5/centery:37.446/centerx:24.9467/maptype:1/shownames:true/mmsi:239981000/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false">
                                                        Browser does not support embedded objects.&lt;br/&gt;Visit directly &lt;a href="http://www.marinetraffic.com/"&gt;www.marinetraffic.com&lt;/a&gt;
                                                </iframe>

                                            </div>


                                        </div>

                                    </div>

                                </div>

                            </div>


                        </div>



                            <div class = "row">
                            <div class = "col">
                                <div>
                                    <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                                        data-toggle="collapse" href="#shippingLogCollapseItem " role="button" aria-expanded="false" aria-controls="orderCollapseItem5" style = "cursor: pointer;"></i>
                                    <span class = "h5-responsive"> <strong> Shipping Log </strong> </span>
                                    <span class = "float-right" style = "font-size: 16px;">
                                        <i class="fa fa-print" aria-hidden="true"></i>
                                        <a class = "blue-text" href = "#"> Print </a>
                                    </span>
                                </div>

                                <hr class = "mt-1" />

                                <div class="collapse.show multi-collapse" id="shippingLogCollapseItem">
                                    <div class="list-group">
                                        <span class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">Delivered already</h5>
                                            <small>Nov 28 1998 - 12:00 PM</small>
                                            </div>
                                            <p class="mb-1">delivered the product already</p>
                                            <small>Phillipines ncr las pinas city</small>
                                        </span>
                                        <span href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">Delivered already</h5>
                                            <small>Nov 28 1998 - 12:00 PM</small>
                                            </div>
                                            <p class="mb-1">delivered the product already</p>
                                            <small>Phillipines ncr las pinas city</small>
                                        </span>
                                        <span href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">Delivered already</h5>
                                            <small>Nov 28 1998 - 12:00 PM</small>
                                            </div>
                                            <p class="mb-1">delivered the product already</p>
                                            <small>Phillipines ncr las pinas city</small>
                                        </span>


                                    </div>
                                </div>



                            </div>
                        </div>

                    </div>


                </div>


            </div>

        </div>

        <hr />
    </div>



</main>