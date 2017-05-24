$(document).ready(function() {
  $('.book_time').off('click').on('click', function() {
    if ( $(this).hasClass('active') ) 
      $(this).removeClass('active')
    else
      $(this).addClass('active')
    return false
  });
});