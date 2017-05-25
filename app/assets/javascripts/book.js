$(document).ready(function() {
  $('.book_time').off('click').on('click', function() {
    if ( $(this).hasClass('active') ) {
      $(this).removeClass('active');
      $(this).find('input[type="checkbox"]').prop("checked", false);
    } else {
      $(this).addClass('active');
      $(this).find('input[type="checkbox"]').prop("checked", true);
    }
    return false
  });
});