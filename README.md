strava-scraper
==============

Scrapes the public profile for a Strava athlete and gives you their current month, year, and all time activity summary data. Built to support the strava-card component (https://github.com/brentvatne/strava-card) because the Strava api does not support unauthenticated activity queries

eg: http://strava-scraper.herokuapp.com/4756028

```json
({"current":{"distance":"25.1km","time":"1h 13m","elevation":"90m"},"year":{"sport":"Cycling","distance":"499.9km","time":"25h 46m","elevation":"2,070m","activities":"61"},"all":{"sport":"Cycling","distance":"499.9km","time":"25h 46m","elevation":"2,070m","activities":"61"}})
```


eg: http://strava-scraper.herokuapp.com/4756028?callback=your_jsonp_callback

```json
your_jsonp_callback({"current":{"distance":"85.9km","time":"7h 43m","elevation":"1,439m"},"year":{"sport":"Running","distance":"267.6km","time":"22h 22m","elevation":"1,625m","activities":"30"},"all":{"sport":"Running","distance":"509.7km","time":"44h 11m","elevation":"3,906m","activities":"81"}})
```
