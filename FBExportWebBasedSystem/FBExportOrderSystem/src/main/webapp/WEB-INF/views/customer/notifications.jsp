<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<main>

    <div class = "container mt-4">
        <h4>
            Notifications
            <i class="fa fa-bell ml-2" aria-hidden="true"></i>
            <a class = "float-right" href = "#" style = "font-size: 16px;"> Clear all </a>
        </h4>
        <hr />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="<c:url value = '/view-profile' />" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="<c:url value = '/notifications' />" class="list-group-item active">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="<c:url value = '/order-list' />" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="<c:url value = '/shipping' />" class="list-group-item">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="<c:url value = '/your-address' />" class="list-group-item">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addresses
                        </a>
                        <a href="<c:url value = '/account-settings' />" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>
                        <a href="<c:url value = '/sign-out' />" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>
                </div>



            </div>

            <div class="col-lg-9">

                <div class="row">
                    <div class="col-md-12">

                        <div class = "notifications">
                                <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Checkout</h5>
                                        <button type="button" class="close" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                    <small> 1 day ago </small>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Checkout</h5>
                                        <button type="button" class="close" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                    <small> 1 day ago </small>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Checkout</h5>
                                        <button type="button" class="close" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                    <small> 1 day ago </small>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Checkout</h5>
                                        <button type="button" class="close" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                    <small> 1 day ago </small>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">Checkout</h5>
                                        <button type="button" class="close" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <p class="mb-1">your order lapu lapu 1 kilo is approved</p>
                                    <small> 1 day ago </small>
                                </a>

                            </div>

                        </div>

                    </div>
                </div>

                <div class = "row mt-3">
                    <a class = "blue-text mx-auto" href = "#"> See more </a>
                </div>



            </div>

        </div>

        <hr />
    </div>

</main> 