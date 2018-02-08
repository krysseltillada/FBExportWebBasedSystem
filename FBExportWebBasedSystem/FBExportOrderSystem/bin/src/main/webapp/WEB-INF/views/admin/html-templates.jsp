<script id = "collapsingOrderDiv" type = "text/template"> 
      <div class = "row slider pt-2 pb-2 pl-1 pr-1">
        
        <div class = "col-lg-12">

          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#items-order-tab" role="tab">Items</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#shipping-order-tab" role="tab">Shipping</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#shipping-instructions-tab" role="tab">Shipping instructions</a>
            </li>
          </ul>

          <div class="tab-content" style = "border-bottom: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD;">
            <div class="tab-pane active" id="items-order-tab" role="tabpanel">
             
              <div class = "p-3">
                <h5> 12 Items ordered </h5>
                <table class="table" style = "border-bottom: 1px solid #E9ECEF; border-left: 1px solid #E9ECEF; border-right: 1px solid #E9ECEF;">
                            <thead>
                              <tr>
                                <th></th>
                                <th></th>
                                <th>Item Name</th>
                                <th>Quantity</th>
                                <th>Total weight</th>
                                <th>Total Price </th>
                              </tr>
                            </thead>
                            <tfoot>
                              <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th>Total: 2000 KILO</th>
                                <th>Total: 200,000,000 PHP </th>
                              </tr>
                            </tfoot>
                            <tbody>
                              <tr>
                                <th scope="row">1</th>
                                <td>
                                  <img src = "img/project-1.jpg" width = "40" height = "40" />
                                </td>
                                <td>
                                  Puffer Fish <br />
                                  150 KILO / PC
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "20" style = "width: 60px;" readonly>
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "200 KILO" style = "width: 90px;" readonly>
                                </td>
                                <td>200 PHP</td>
                              </tr>
                              <tr>
                                <th scope="row">2</th>
                                <td>
                                  <img src = "img/project-1.jpg" width = "40" height = "40" />
                                </td>
                                <td>
                                  Puffer Fish <br />
                                  150 KILO / PC
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "20" style = "width: 60px;" readonly>
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "200 KILO" style = "width: 90px;" readonly>
                                </td>
                                <td>200 PHP</td>
                              </tr>
                              <tr>
                                <th scope="row">3</th>
                                <td>
                                  <img src = "img/project-1.jpg" width = "40" height = "40" />
                                </td>
                                <td>
                                  Puffer Fish <br />
                                  150 KILO / PC
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "20" style = "width: 60px;" readonly>
                                </td>
                                <td>
                                  <input class = "text-center" type="text" value = "200 KILO" style = "width: 90px;" readonly>
                                </td>
                                <td>200 PHP</td>
                              </tr>
                            </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="shipping-order-tab" role="tabpanel">
              <div class = "p-4">

                <div>
                  <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                      data-toggle="collapse" href="#shippingInformationCollapseItem " role="button" aria-expanded="false" aria-controls="shippingInformationCollapseItem" style = "cursor: pointer;"></i>
                  <span class = "h5-responsive"> <strong> Shipping information </strong> </span>
                  <span class = "float-right"> 
                    <a class = "blue-text" id = "updateShipping" href = "javascript:void()"> Update Shipping </a> 
                    <i class="fa fa-refresh ml-1" aria-hidden="true"></i>
                  </span>
               
                </div>

                <hr class = "mt-1" />

                <div class="collapse.show multi-collapse" id="shippingInformationCollapseItem">


                  <div class = "row no-gutters">
                      <div class = "col-8">
                          <strong> Address <i class="fa fa-address-book-o" aria-hidden="true"></i> </strong> :  Rivera compound saint joseph subdivision pulang lupa 2 
                      </div>
                      <div class = "col-4">
                          <strong> Zipcode <i class="fa fa-home" aria-hidden="true"></i>: </strong>  1742 
                      </div>
                  </div>
                  <div class = "row no-gutters">
                      <div class = "col-8">
                          <strong> Country <i class="fa fa-globe" aria-hidden="true"></i> : </strong> Phillipines
                      </div>
                      <div class = "col-4">
                          <strong> City <i class="fa fa-map" aria-hidden="true"></i> : </strong> Las pinas city 
                      </div>
                  </div>
                  <div class = "row no-gutters">
                      <div class = "col-8">
                          <strong> Shipment status : </strong>  On Cargo Ship <i class="fa fa-ship" aria-hidden="true"></i>
                      </div>
                      <div class = "col-4">
                          <strong> Your Phone number <i class="fa fa-mobile-phone" aria-hidden="true"></i> : </strong> 09151829105 
                      </div>
                  </div>
                  <div class = "row no-gutters">
                      <div class = "col-8">
                          <strong> Departure : </strong>  November 11 2018
                      </div>
                      <div class = "col-4">
                          <strong> Arrival : </strong> November 30 2018 
                      </div>
                  </div>

                  <br />

                  <div>
                      <i class="fa fa-chevron-circle-down fa-lg mr-1" aria-hidden="true"
                          data-toggle="collapse" href="#vesselStatusCollapseItem " role="button" aria-expanded="false" aria-controls="vesselStatusCollapseItem" style = "cursor: pointer;"></i>
                      <span class = "h5-responsive"> <strong> Vessel Status </strong> </span>
                      <span class = "float-right" style = "font-size: 14px;">
                          <i class="fa fa-map-marker" aria-hidden="true"></i>
                          <a class = "blue-text" href = "javascript:void(0)" id = "updateVesselStatus"> Update status </a>
                      </span>
                  </div>

                  <hr class = "mt-1" />

                  <div class="collapse" id="vesselStatusCollapseItem">

                      <div class = "row no-gutters">
                          <div class = "col-8">
                              <strong> Vessel name: </strong> AQUA JEWEL 
                          </div>
                          <div class = "col-4">
                              <strong> IMO Number: </strong> 8976671
                          </div>
                      </div>

                      <div class = "row no-gutters">
                          <div class = "col-8">
                              <strong> MMSI Number: </strong> 239981000 
                          </div>
                            <div class = "col-4">
                              <strong> Destination: </strong> Madagascar 
                          </div>
                          
                      </div>

                    

                      <hr class = "mt-1" />

                      <div class = "row">

                          <div class = "col shipTrackingMap">

                          </div>


                      </div>

                  </div>

                </div>

                  <div>
                      <i class="fa fa-chevron-circle-down fa-lg mr-1 collapsed" aria-hidden="true" data-toggle="collapse" href="#shippingLogCollapseItem " role="button" aria-expanded="false" aria-controls="orderCollapseItem5" style="cursor: pointer;"></i>
                      <span class="h5-responsive"> <strong> Shipping Log </strong> </span>
                  </div>

                  <hr class="mt-1">

                  <div class="collapse.show multi-collapse collapse" id="shippingLogCollapseItem" style="">
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
            <div class = "tab-pane" id = "shipping-instructions-tab" role="tabpanel">
              <div class = "p-4">
                <h5> Shipping instructions: </h5>
                <hr class="mt-1">
                <span> 
                  please place the cargo at the right hand side of the area
                </span>
              </div>
            </div>
            
          
          </div>

          
        </div>
       
      </div> 
</script>

<script id = "shipMapTrackingTemplate" type = "text/template">
    <iframe name="marinetraffic" id="marinetraffic" width="100%" height="450" scrolling="no" frameborder="0"
            src="http://www.marinetraffic.com/en/ais/embed/zoom:5/centery:37.446/centerx:24.9467/maptype:1/shownames:true/mmsi:239981000/shipid:0/fleet:/fleet_id:/vtypes:/showmenu:true/remember:false">
            Browser does not support embedded objects.&lt;br/&gt;Visit directly &lt;a href="http://www.marinetraffic.com/"&gt;www.marinetraffic.com&lt;/a&gt;
    </iframe> 
</script>

<script id = "collapsingInventoryProductTemplatePosted" type = "text/template"> 
    <div class = "row slider pt-2 pb-2 pl-1 pr-1">
    <div class = "col-lg-4">


        <div class="tab-content">
        <div class="tab-pane active" id="img1" role="tabpanel">
            <img src = "img/bg.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img2" role="tabpanel">
            <img src = "img/project-1.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img3" role="tabpanel">
                <img src = "img/project-2.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img4" role="tabpanel">
            <img src = "img/project-3.jpg" width = "290" height = "200" />
        </div>
        </div>

        <ul class="nav mt-1" role="tablist">
        <li class="nav-item">
            <a class="active pr-1" data-toggle="tab" href="#img1" role="tab">
            <img src = "img/bg.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img2" role="tab">
                <img src =  "img/project-1.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img3" role="tab">
                <img src = "img/project-2.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a data-toggle="tab" href="#img4" role="tab">
                <img src = "img/project-3.jpg" width = "70" height = "70" />
            </a>
        </li>

        </ul>
    </div>
    <div class = "col-lg-8">
        <h5>
        Description: Lapu Lapu
        <span class = "float-right"> Origin: Leyte </span>
        </h5>
        <hr class = "mt-0 mb-2" />

        <p class = "text-justify">
        - In JSP, java code can be written inside the jsp page using the scriptlet tag. Let's see what are the scripting elements first.
        </p>

        <hr class = "mt-0 mb-2"/>

        <ul class = "list-unstyled">
        <li class = "mb-1"> <strong> Supplier: </strong> Harmonyssss </li>
        <li class = "mb-1"> <strong> Supplier Contact number: </strong> 09151828105 </li>
        <li class = "mb-1"> <strong> Supplier Address: </strong> 1700 blk 7 saint joseph subd pulanglupa 2 las pinas city </li>
        <li class = "mb-1"> <strong> Date of delivery: </strong> May 12 1988  </li>
        </ul>

        <br />

        <button type="button" class="btn bg-green float-right mr-1">Post <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>
        <button type="button" class="btn bg-blue float-right mr-1">Edit <i class="fa fa-pencil" aria-hidden="true"></i> </button>
        <button type="button" class="btn bg-red float-right mr-1">Delete <i class="fa fa-trash" aria-hidden="true"></i> </button>
    </div>
    </div>
</script>

<script id = "collapsingInventoryProductTemplateUnposted" type = "text/template">
    <div class = "row slider pt-2 pb-2 pl-1 pr-1">
    <div class = "col-lg-4">


        <div class="tab-content">
        <div class="tab-pane active" id="img1" role="tabpanel">
            <img src = "img/bg.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img2" role="tabpanel">
            <img src = "img/project-1.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img3" role="tabpanel">
                <img src = "img/project-2.jpg" width = "290" height = "200" />
        </div>
        <div class="tab-pane" id="img4" role="tabpanel">
            <img src = "img/project-3.jpg" width = "290" height = "200" />
        </div>
        </div>

        <ul class="nav mt-1" role="tablist">
        <li class="nav-item">
            <a class="active pr-1" data-toggle="tab" href="#img1" role="tab">
            <img src = "img/bg.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img2" role="tab">
                <img src =  "img/project-1.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a class="pr-1" data-toggle="tab" href="#img3" role="tab">
                <img src = "img/project-2.jpg" width = "70" height = "70" />
            </a>
        </li>
            <li class="nav-item">
            <a data-toggle="tab" href="#img4" role="tab">
                <img src = "img/project-3.jpg" width = "70" height = "70" />
            </a>
        </li>

        </ul>
    </div>
    <div class = "col-lg-8">
        <h5>
        Description: Lapu Lapu
        <span class = "float-right"> Origin: Leyte </span>
        </h5>
        <hr class = "mt-0 mb-2" />

        <p class = "text-justify">
        - In JSP, java code can be written inside the jsp page using the scriptlet tag. Let's see what are the scripting elements first.
        </p>

        <hr class = "mt-0 mb-2"/>

        <ul class = "list-unstyled">
        <li class = "mb-1"> <strong> Supplier: </strong> Harmonyssss </li>
        <li class = "mb-1"> <strong> Supplier Contact number: </strong> 09151828105 </li>
        <li class = "mb-1"> <strong> Supplier Address: </strong> 1700 blk 7 saint joseph subd pulanglupa 2 las pinas city </li>
        <li class = "mb-1"> <strong> Date of delivery: </strong> May 12 1988  </li>
        </ul>

        <br />

        <button type="button" class="btn bg-dark text-white float-right mr-1">Unpost <i class="fa fa-clipboard ml-1" aria-hidden="true"></i>  </button>
        <button type="button" class="btn bg-blue float-right mr-1">Edit <i class="fa fa-pencil" aria-hidden="true"></i> </button>
        <button type="button" class="btn bg-red float-right mr-1">Delete <i class="fa fa-trash" aria-hidden="true"></i> </button>
    </div>
    </div>
</script>

<script id = "collapsingClientTableMoreInformation" type="text/template">

    <div class = "row showMoreInfoSlider pt-2 pb-2 pl-1 pr-1">
        <div class = "col-lg-4">
        <h3>User's Activities</h3>
        <table id="user-activity-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>User's Activity</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                <th>User's Activity</th>
                <th>Date</th>
                <th>Time</th>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>Bought products</td>
                    <td>January 29, 2018</td>
                    <td>13:30:35</td>
                </tr>
            </tbody>
            </table>

        </div>
    </div>
    </div>

    <!--Pagination -->
    <nav class="my-4 ">
        <ul class="pagination pagination-circle pg-blue mb-0">

            <!--First-->
            <li class="page-item disabled"><a class="page-link">First</a></li>

            <!--Arrow left-->
            <li class="page-item disabled">
                <a class="page-link" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>

            <!--Numbers-->
            <li class="page-item active"><a class="page-link">1</a></li>
            <li class="page-item"><a class="page-link">2</a></li>
            <li class="page-item"><a class="page-link">3</a></li>
            <li class="page-item"><a class="page-link">4</a></li>
            <li class="page-item"><a class="page-link">5</a></li>

            <!--Arrow right-->
            <li class="page-item">
                <a class="page-link" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>

            <!--First-->
            <li class="page-item"><a class="page-link">Last</a></li>

        </ul>
    </nav>
    <!--/Pagination -->


</script>

<script id = "collapsingEmployeeTableMoreInformation" type="text/template">

    <div class = "row showMoreInfoSlider pt-2 pb-2 pl-1 pr-1">
        <div class = "col-lg-4">
        <h3>Employee's Activities</h3>
        <table id="employee-activity-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Employee's Activity</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                <th>Employee's Activity</th>
                <th>Date</th>
                <th>Time</th>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>Bought products</td>
                    <td>January 29, 2018</td>
                    <td>13:30:35</td>
                </tr>
            </tbody>
            </table>

        </div>
    </div>
    </div>

    <!--Pagination -->
    <nav class="my-4 ">
        <ul class="pagination pagination-circle pg-blue mb-0">

            <!--First-->
            <li class="page-item disabled"><a class="page-link">First</a></li>

            <!--Arrow left-->
            <li class="page-item disabled">
                <a class="page-link" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>

            <!--Numbers-->
            <li class="page-item active"><a class="page-link">1</a></li>
            <li class="page-item"><a class="page-link">2</a></li>
            <li class="page-item"><a class="page-link">3</a></li>
            <li class="page-item"><a class="page-link">4</a></li>
            <li class="page-item"><a class="page-link">5</a></li>

            <!--Arrow right-->
            <li class="page-item">
                <a class="page-link" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>

            <!--First-->
            <li class="page-item"><a class="page-link">Last</a></li>

        </ul>
    </nav>
    <!--/Pagination -->


</script>