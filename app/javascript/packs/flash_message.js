window.closeAlert = function(){
  setTimeout(function(){
    if ($('.alert-dismissible').length > 0) {
      $('.alert-dismissible').fadeOut(500, function(e) { $(this).remove();});
    }
  }, 50000);
}
