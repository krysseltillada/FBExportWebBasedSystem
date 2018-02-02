<header class="page-header pb-3">
    <div class="container-fluid">

        <div class = "row">
        <div class = "col-lg">
            <span class="h3 no-margin-bottom mr-2">System Settings</span>
        </div>
        </div>

    </div>
    </header>

    <section class = "no-padding-top p-0">
        <div class = "container-fluid p-0">
        
        <div class = "row">
            <div class = "col-lg">
            <div class = "card mb-0">
                <div class = "card-body ml-2">
                <h3> Log out timeout </h3>
                <hr />
                <div class="form-inline">
                    <label class="mr-sm-3" for="inlineFormCustomSelect">Log out Every: </label>
                    <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" style = "width: 200px;">
                    <option selected>3 minutes</option>
                    <option value="1">5 minutes</option>
                    <option value="2">10 minutes</option>
                    <option value="3">30 minutes</option>
                    </select>
                </div>

                <br />
                <br />

                <h3> System backup </h3>
                <hr />
                <div class="form-inline">
                    <label class="mr-sm-3" for="inlineFormCustomSelect">Backup every: </label>
                    <input type = "text" value = "12:00 AM" class = "form-control timepicker mr-2" 
                            data-timepicki-tim="12" data-timepicki-mini="00" data-timepicki-meri="AM"  style = "width: 100px;" />
                    
                    <button type="button" class="btn btn-primary btn-sm mr-1">Backup data</button>
                    <button type="button" class="btn btn-primary btn-sm">Restore data</button>

                </div>

                <br />
                
                <button type="button" class="btn btn-primary float-right">Apply changes</button>

                </div>
            </div>
            

        </div>

    </div>
    </section> 