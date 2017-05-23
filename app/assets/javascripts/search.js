$(document).ready(function() {
  $('.single-item').slick();
  
  const msgEmprySearch = document.querySelector('.msg-empty-search');

  $('#search-query').keyup(function() {
    searchFilter($(this));
  });

  function searchFilter(self) {
    var val = $.trim(self.val()).replace(/\s+/g, ' ').toLowerCase();

    $('.sg').removeClass('hide').filter(function() {
      var text = $(this).find('.product-title').text().replace(/\s+/g, ' ').toLowerCase();
      return !~text.indexOf(val);
    }).addClass('hide');

    if ($('.sg:visible').length === 0){
      msgEmprySearch.classList.remove('hide');
    } else {
      msgEmprySearch.classList.add('hide');
    }
  }

  function coverFilter() {
    $('.cover_filter').find('input').on('click', function() {
      var val = parseInt($(this).val(), 10);

      if ($(this).prop('checked') === true) {

        $('.sg').each(function() {
          var coverVal = $(this).find('.product-cover-title').data('cover');

          if ( (coverVal === val) ) {
            $(this).removeClass('hide');
            $(this).addClass('active');
          } else {
            if (!$(this).hasClass('active')) {
              $(this).addClass('hide');
            }
          }

        });
      } else {
        var numberCheckbox = $('.cover_filter').find('input:checked').length;

        $('.sg').each(function() {
          var coverVal = $(this).find('.product-cover-title').data('cover');

          if ( (coverVal === val) ) {
            $(this).addClass('hide');
            $(this).removeClass('active');
          }

        });

        if (numberCheckbox === 0) 
          $('.sg').removeClass('hide');
      }

      if ( $('#search-query').val().trim().length !== 0 ) 
        searchFilter($('#search-query'));
    });

  }

  coverFilter();
})