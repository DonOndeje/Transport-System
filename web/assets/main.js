

$(document).ready(function(){
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
      
      $('.delete-driver').click( function () {
         $(this).html(preloaderHtml);
         displayToast("Deleting driver " + $(this).attr('id'), "info");  
      });
             
      $('.delete-user').click(function () {
          $(this).html(preloaderHtml);
          displayToast("Deleting user " + $(this).attr('id'), "info");
      });
      
      $('.delete-vehicle').click(function () {
          $(this).html(preloaderHtml);
          displayToast("Deleting vehicle " + $(this).attr('id'), "info");
      });
   
});




