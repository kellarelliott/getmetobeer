$(function () {

  var queryString = window.location.pathname;
  var queryStringArray = queryString.split('/')
  var breweryId = queryStringArray[queryStringArray.length - 1]


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
      $('.beer-table-div').css("max-height", `${height}px`);
      $('.beer-table-div').css("overflow", "hidden");
      $('#read').text("Read More...");
    };
  });





  $.get("/comments").success(function (data) {
    var htmlString = "";

    $.each(data, function (index, review) {

      var message = review['message'];
      var rating = review['rating'].toString();
      htmlString += '<div>' + message + '</div><span>' + rating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
    });
    var divReview = $('.review');
    divReview.html(htmlString);
  });

  $('#submit-comment').click(function () {
    event.preventDefault();

    var message = $('#comment-message').val();
    var rating = $('#comment-rating').val();

    $.post("/comments", {
      comment: {
        message: message,
        rating: rating,
        brewery_db_id: breweryId
      }
    }).success(function () {
      htmlString = '<div>' + message + '</div><span>' + rating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
      var divReview = $('.review');
      divReview.append(htmlString);
    });
  });
})
