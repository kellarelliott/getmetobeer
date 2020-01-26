$(function () {
  var queryString = window.location.pathname;
  var queryStringArray = queryString.split('/');
  var userId = queryStringArray[queryStringArray.length - 1];

  $.get("/comments").success(function (data) {
    commentString = `<tr>
      <th class="col-2">Location</th>
      <th class="col-1">Rating</th>
      <th class="col-5">Review</th>
      <th class="col-5">Date</th>
    </tr>`;

    $.each(data, function (index, review) {
      if (userId === review['user_id'].toString()) {
        var message = review['message'];

        var rating = review['rating'].toString()
        var date = review['created_at'];
        var goodDate = date.split('T')[0];
        var location = review['location'];
        var breweryId = review['brewery_db_id'];
        commentString += '<tr><td><a href="/breweries/' + breweryId + '" style="color:black">' + location + '</a></td><td>' + rating + '</td><td>' + message + '</td><td>' + goodDate + '</td></tr>';

      };
    });
    var reviewTable = $('.user_reviews_table');
    reviewTable.html(commentString);
  });
})
