

$(document).ready(function () {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }

    var preloaderHtml = `<div class="preloader-wrapper small active">
                            <div class="spinner-layer spinner-green-only">
                              <div class="circle-clipper left">
                                <div class="circle"></div>
                              </div><div class="gap-patch">
                                <div class="circle"></div>
                              </div><div class="circle-clipper right">
                                <div class="circle"></div>
                              </div>
                            </div>
                          </div>`;

    $('.delete-driver').click(function () {
        var $this = $(this);
        $(this).html(preloaderHtml);

        $.ajax({
            url: "/TripManagement/Driver",
            method: 'GET',
            data: {
                id: $this.attr('id'),
                action: 'delete'
            },
            success: function (result) {
                $('#driver-' + $this.attr('id')).hide();
                displayToast(result, "success");
                $this.html("Delete");
            },
            error: function (event, jqxhr, settings) {
                displayToast(event.responseText, "error");
                $this.html("Delete");
            }
        });
    });

    $('.delete-user').click(function () {
        var $this = $(this);
        $(this).html(preloaderHtml);

        $.ajax({
            url: "/TripManagement/User",
            method: 'GET',
            data: {
                id: $this.attr('id'),
                action: 'delete'
            },
            success: function (result) {
                $('#user-' + $this.attr('id')).hide();
                displayToast(result, "success");
                $this.html("Delete");
            },
            error: function (event, jqxhr, settings) {
                displayToast(event.responseText, "error");
                console.log(event.responseText);
                $this.html("Delete");
            }
        });
    });

    $('.delete-vehicle').click(function () {
        var $this = $(this);
        $(this).html(preloaderHtml);

        $.ajax({
            url: "/TripManagement/Vehicle",
            method: 'GET',
            data: {
                id: $this.attr('id'),
                action: 'delete'
            },
            success: function (result) {
                $('#vehicle-' + $this.attr('id')).hide();
                displayToast(result, "success");
                $this.html("Delete");
            },
            error: function (event, jqxhr, settings) {
                displayToast(event.responseText, "error");
                console.log(event.responseText);
                $this.html("Delete");
            }
        });
    });

    $('.add-vehicle').click(function () {
        var $this = $(this);
        //$(this).html(preloaderHtml);
                
        $.ajax({
            url: "/TripManagement/Vehicle",
            method: 'POST',
            data: {
                id: $this.attr('id'),
                action: 'add',
                vehicleType: $("#vehicle_type").val(),
                numberPlate: $("#number_plate").val(),
                capacity: $("#capacity").val()
            },
            success: function (result) {
                $('#vehicle-' + $this.attr('id')).hide();
                displayToast(result, "success");
                //$this.html("Delete");
            },
            error: function (event, jqxhr, settings) {
                displayToast(event.responseText, "error");
                console.log(event.responseText);
                //$this.html("Delete");
            }
        });
    });


    $('.add-driver').click(function () {
        var $this = $(this);
        //$(this).html(preloaderHtml);
              //console.log($("#driver_name").val() + ":" + $("#email").val() + ":" + $("#contact").val());  
        $.ajax({
            url: "/TripManagement/Driver",
            method: 'POST',
            data: {
                id: $this.attr('id'),
                action: 'add',
                driver_name: $("#driver_name").val(),
                email: $("#email").val(),
                contact: $("#contact").val()
            },
            success: function (result) {
                $('#vehicle-' + $this.attr('id')).hide();
                displayToast(result, "success");
                //$this.html("Delete");
            },
            error: function (event, jqxhr, settings) {
                displayToast(event.responseText, "error");
                console.log(event.responseText);
                //$this.html("Delete");
            }
        });
    });
});




