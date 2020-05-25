require "selenium/webdriver"

Capybara.default_driver = :selenium_chrome_headless
Capybara.javascript_driver = :selenium_chrome_headless
Capybara.ignore_hidden_elements = false
Capybara.default_max_wait_time = 4
Capybara::Screenshot.register_driver(:selenium_chrome_headless) do |driver, path|
  driver.browser.save_screenshot(path)
end
Capybara.register_driver(:selenium_chrome_private) do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.args << "-incognito"
  options.args << "-headless"
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
