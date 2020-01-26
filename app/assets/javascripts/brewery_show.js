$(function () {
  var queryString = window.location.pathname;
  var queryStringArray = queryString.split('/');
  var breweryDbId = queryStringArray[queryStringArray.length - 1];

  if ($('.beer-table-div').height() < 300) {
    $('#read').css('display', 'none');
  };

  var height = $('.beer-table-div').height();

  $('#read').click(function () {


    if ($('#read').text() === "Read More...") {
      $('.beer-table-div').css("max-height", "100%");
      $('#read').text("Read Less...");
    }
    else {
      $('.beer-table-div').css("max-height", height + 'px');
      $('.beer-table-div').css("overflow", "hidden");
      $('#read').text("Read More...");
    };
  });

  $.get("/comments").success(function (data) {
    var htmlString = "";

    $.each(data, function (index, review) {
      if (breweryDbId === review['brewery_db_id']) {
        var message = review['message'];
        var rating = review['rating'].toString();
        htmlString += '<div>' + message + '</div><span>' + rating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
      }
    });
    var divReview = $('.review');
    divReview.html(htmlString);

  });
  $('#new-board').on('click', MicroModal.show.bind(null, 'create-board'));
  $('#save-board').click(function () {
    event.preventDefault();

    var message = $('#comment-message').val();
    var rating = $('#comment-rating').val();
    var location = $('#brewery_location').text();
    console.log(location)


    $.post("/comments", {
      comment: {
        message: message,
        rating: rating,
        brewery_db_id: breweryDbId,
        location: location
      }
    }).success(function () {
      htmlString = '<div>' + message + '</div><span>' + rating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
      var divReview = $('.review');
      divReview.prepend(htmlString);
      $('#comment-message').val('');
      $('#comment-rating').val('');
      MicroModal.close('create-board');
    });
  });

})
