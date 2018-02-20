function displayToast(message, type){
    if (type == 'success'){
        toastr.success(message);
    }else if (type == 'info') {
        toastr.info(message);
    }else if ( type == 'warning') {
        toastr.warning(message);
    }else {
        toastr.error(message);
    }  
}