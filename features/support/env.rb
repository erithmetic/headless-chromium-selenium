require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot'

Capybara.run_server = false

require 'selenium-webdriver'

Capybara.register_driver :headless_chromium do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      'binary' => "/chromium-latest-linux/latest/chrome-linux/chrome",
      'args' => %w{headless no-sandbox disable-gpu}
    }
  )
  driver = Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: caps
  )
end

Capybara.register_driver :selenium_headless_chromium do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      'binary' => "/chromium-latest-linux/latest/chrome-linux/chrome",
      'args' => %w{headless no-sandbox disable-gpu}
    }
  )
  driver = Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://seleniumnode:4444/wd/hub',
    desired_capabilities: caps
  )
end

save_path = File.expand_path('../../../output', __FILE__)
FileUtils.mkdir_p save_path
Capybara.save_path = save_path
Capybara.default_driver = ENV.fetch('CAPYBARA_DRIVER', 'headless_chromium').to_sym
Capybara.app_host = 'http://app.faraday.test'

require 'capybara/dsl'

#Capybara::Screenshot.register_driver(:selenium_remote) do |driver, path|
  #driver.browser.save_screenshot(path)
#end
