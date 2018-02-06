<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2">Orders</span>
            <span class = "small ml-2 float-right"> <a href = "javascript:void(0)" id = "deleteProduct" class = "text-muted" style = "cursor: not-allowed;"> Delete order <i class="fa fa-trash ml-1" aria-hidden="true"></i> </a> </span>
            <span class = "small float-right"> <a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> Filter Orders <i class="fa fa-filter ml-1" aria-hidden="true"></i> </a> </span>
        </div>
        </div>

    </div>
</header>

<section class = "no-padding-top p-0">
    <div class = "container-fluid p-0">
        <div class="collapse" id="collapseExample">

            <div clsss = "row">

            <div class = "col-lg-12 p-0 m-0">
                <div class = "card m-0">
                <div class = "card-body pt-3 pb-3">

                        <form class="form-inline ml-2 small">
                        
                        <label class="mr-sm-2" for="inlineFormCustomSelect">Status: </label>
                        <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 115px;">
                            <option selected> All </option>
                            <option>Pending</option>
                            <option value="1">Approved</option>
                            <option value="2">Reject</option>
                            <option value="3">To Ship</option>
                            <option value="3">Received</option>
                        </select>

                        <label class="mr-sm-2" for="inlineFormCustomSelect">Shipment: </label>
                        <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 135px;">
                            <option selected> All </option>
                            <option value="1">On Cargo Ship</option>
                            <option value="2">On Truck</option>
                        </select>

                        <label class="mr-sm-2" for="inlineFormCustomSelect">Payment: </label>
                        <select class="custom-select mb-2 mr-sm-3 mb-sm-0" id="inlineFormCustomSelect" style = "width: 150px;">
                            <option selected>All</option>
                            <option>Cash on delivery</option>
                            <option>Paypal</option>
                            
                        </select>

                        <label class="mr-sm-2" for="inlineFormCustomSelect">Sort by: </label>
                        <select class="custom-select mb-2 mr-sm-1 mb-sm-0" id="inlineFormCustomSelect" style = "width: 140px;">
                            <option selected>Order No </option>
                            <option value="1">Date ordered</option>
                            <option value="1">Receive date</option>
                            <option value="2">Customer</option>
                            <option value="3">Price</option>
                            <option value="3">Weight</option>
                            <option value="3">Items</option>
                        </select>

                            <select class="custom-select mb-2 mb-sm-0" id="inlineFormCustomSelect" style = "width: 120px;">
                            <option selected>Unsorted </option>
                            <option>Ascending </option>
                            <option value="1">Descending</option>
                        </select>
                        

                        </form>
                        
                    </div>
                </div>
            </div>
            </div>
        </div>

        <div class = "row">
            <div class = "col-lg">
                <div class = "card mb-0">
                    <div class = "card-body pt-3 pb-5 pl-0 pr-0" style = "overflow-x: auto;">
                    <table id="orderTable" class="table table-sm" cellspacing="0" width="100%" style = "border-bottom: 1px solid #E9ECEF;">
                        <thead>
                            <tr>
                                <th> <input type="checkbox" value="" class="checkbox-template checkbox-delete" id = "checkbox-all"> </th>
                                <th> </th>
                                <th> Order</th>
                                <th> Status <i class="fa fa-tasks ml-1" aria-hidden="true"></i> </th>
                                <th> Shipping Address </th>
                                <th> Total </th>

                                <th> Date </th>


                            </tr>
                        </thead>
                        <tfoot>
                            <tr>

                                <th></th>
                                <th> </th>
                                <th> Order </th>
                                <th> Status </th>
                                <th> Shipping address </th>
                                <th> Total </th> 
                            
                                <th> Date </th>


                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>

                                <td></td>
                                <td> <i class="fa fa-chevron-circle-down fa-lg" aria-hidden="true" style="cursor: pointer;"></i> </td>
                                <td>
                                    <h3><span class="badge badge-success p-1">Order#12312</span></h3>
                                    
                                    <span style = "font-size: 13px;">
                                    <strong> by: </strong> <strong> <a href = "#"> Kryssel tillada </a> </strong>
                                    <br />
                                    <strong> Payment: </strong> Cash on delivery <i class="fa fa-truck ml-1" aria-hidden="true"></i>
                                
                                    </span>
                                </td>
                                <td> 

                                <div style = "font-size: 13px;">
                                    <strong> Order: </strong> 
                                    
                                
                                    <h6> 

                                    
                                    <div class="btn-group dropdown-select">
                                        <button type="button" style = "background-color: #FFC107;" class="btn btn-sm text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Pending
                                        </button>
                                        <div class="dropdown-menu">
                                        <h6 class="dropdown-header">Mark as</h6>
                                        
                                        </div>
                                    </div>
                                    
                                    </h6>

                                    
                                    <strong > Shipment: </strong> <br />
                                    On Cargo Ship <i class="fa fa-ship ml-1" aria-hidden="true"></i>

                                </div>
                                </td>
                                <td style = "max-width: 250px;">

                                <span style = "font-size: 14px;">

                                <strong> Receiver's name: </strong> 
                                <span style = "font-size: 12px;">
                                Judy Ann Mari N. Ando
                                </span>
                                <br/>
                                <strong> Phone number: </strong> 
                                <span style = "font-size: 12px;">
                                09151829105
                                </span>
                                <br/>
                                <strong> Address <span style = "font-size: 12px;"> (User account) </span>:  
                
                                </strong> <br />
                                <span style = "font-size: 12px;">
                                1700 blk 7 saint joseph subd pulanglupa 2  1700 blk 7 saint joseph subd pulanglupa 2 Cavite city
                                </span>
                                <br />
                                

                                <strong> Country <span style = "font-size: 12px;"> (City) </span>:  </strong> <br />
                                <span style = "font-size: 12px;">
                                    United States(New york)
                                </span>
                                <br />

                                </td>
                                <td>

                                <span style = "font-size: 13px;"> 
                                <strong> Items: </strong> <br />
                                    <span style = "font-size: 12px;">
                                    12000 items
                                    </span>
                                <br />

                                <strong> Weight: </strong> <br />
                                    <span style = "font-size: 12px;">
                                    10000 KILO 
                                    </span> <br />

                                <strong> Price: </strong> <br />
                                    <span style = "font-size: 12px;">
                                    1,000,000,000 PHP
                                    </span>

                                    </span>
                                </td>

                                <td>

                                <span style = "font-size: 13px;"> 

                                    <strong> Ordered: </strong> <br />
                                    <span style = "font-size: 12px;">
                                        November 28 1998
                                    </span>
                                    <br />

                                    <strong> Expected: </strong> <br />
                                    <span style = "font-size: 12px;">
                                        November 28 1998
                                    </span>
                                    <br />

                                </span>
                                
                                </td>
                                
                                
                            
                                
                            </tr>
                            
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>  