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
    ratingTotal = 0;
    count = 0

    $.each(data, function (index, review) {
      if (breweryDbId === review['brewery_db_id']) {
        var message = review['message'];
        var stringRating = review['rating'].toString();
        var email = review['email']
        htmlString += '<div>' + message + '-' + '<span class="user_email">' + email + '</span></div><span>' + stringRating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
        var rating = review['rating']
        ratingTotal += rating;
        count++
        ratingAvg = (ratingTotal / count).toFixed(2);
      }
    });
    var divReview = $('.review');
    divReview.html(htmlString);
    var divAvg = $('.avg-rating');
    divAvg.html(ratingAvg + '<i class="fa fa-star" aria-hidden="true">');

  });
  $('#new-board').on('click', MicroModal.show.bind(null, 'create-board'));
  $('#save-board').click(function () {
    event.preventDefault();

    var message = $('#comment-message').val();
    var rating = $('#comment-rating').val();
    var location = $('#brewery_location').text();
    if (message != '' && 0 <= parseInt(rating, 10) <= 5) {

      $.post("/comments", {
        comment: {
          message: message,
          rating: rating,
          brewery_db_id: breweryDbId,
          location: location
        }
      }).success(function () {
        htmlString = '<div>' + message + '-' + '<span class= "user_email">' + user_email + '</span></div><span>' + rating + '<i class="fa fa-star" aria-hidden="true"></i></span><hr class="review-split"/>';
        var divReview = $('.review');
        count++;
        var postRatingTotal = ratingTotal + parseInt(rating, 10);
        var newAvg = (postRatingTotal / count).toFixed(2);
        var divAvg = $('.avg-rating');
        divReview.prepend(htmlString);
        divAvg.html(newAvg + '<i class="fa fa-star" aria-hidden="true">')
        $('#comment-message').val('');
        $('#comment-rating').val('');
        MicroModal.close('create-board');
      });
    } else {
      alert('Invalid input. Make sure you have written a message and your rating is a number from 1 to 5');
    }
  });
})
