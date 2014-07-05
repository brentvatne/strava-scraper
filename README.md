strava-scraper
==============

Scrapes the public profile for a Strava athlete and gives you their current month, year, and all time activity summary data. Built to support the strava-card component (https://github.com/brentvatne/strava-card) because the Strava api does not support unauthenticated activity queries

eg: http://strava-scraper.herokuapp.com/4756028

```json
({"current":{"distance":"25.1km","time":"1h 13m","elevation":"90m"},"year":{"sport":"Cycling","distance":"499.9km","time":"25h 46m","elevation":"2,070m","activities":"61"},"all":{"sport":"Cycling","distance":"499.9km","time":"25h 46m","elevation":"2,070m","activities":"61"}})
```
