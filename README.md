# GetMetoBeer
https://getmetobeer.herokuapp.com/

The getmetobeer website is designed to help people find a brewery near them, and read reviews about different breweries.

*In order to fully experience this site you should make an account.

*This app uses the Google Maps API and brewery_DB API. The brewery_DB API is using a sandbox environment, so not all cities will have breweries.

*If you are searching for a brewery near you, a good example is Denver. You can also try Chicago. If you search in a city that does not have a brewery in it, a message will appear letting you know.

*If you are searching for a specific brewery, you can try such breweries as Lagunitas, Oskar Blues, or Breckenridge brewery. There are plenty more.

*This app uses the HTTParty gem to get information from the brewery_DB API. This can be seen in the breweries controller.

*Reviews for a brewery will automatically update without needing to refresh the page as will the average rating.

![Image description](/getmetobeer.gif)
