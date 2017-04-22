# Using Selenium with Headless Chromium 

As of April 21, 2017, the upcoming release of Google Chrome 59 will support the
`--headless` option, meaning you can run chrome without xvfb on your CI system.

The latest build of chromium also lets you do this, but unfortunately the 2.29
build of chromedriver (the interface between selenium and chrome/chromium) does
not support chrome > 58.

This is a sample of a custom-built chromedriver with latest headless chromium.


# Running the sample


To run a test container in which ruby/capybara runs a local chromedriver, run:

```
docker-compose build test
docker-compose run test
```

All tests should pass!

To test out a modified selenium base node image, run:

```
docker-compose build
docker-compose run testselenium
```
