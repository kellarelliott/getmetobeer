$(function () {
  $('#search').val('');
  $('#hidden_search').val('');

  var hidden = 'yes'
  $('.magnify_glass').click(function () {
    if (hidden === 'yes') {
      $('.hidden_search_div').css("display", "block");
      hidden = 'no'
    } else {
      $('.hidden_search_div').css("display", "none");
      hidden = 'yes'
    }
  });
});
