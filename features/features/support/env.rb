require 'brstring'
require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'
require 'webdrivers/chromedriver'

Capybara.register_driver :site_prism do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
end

def chrome_options
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('disable-web-security')
  options.add_argument('disable-infobars')
  options.add_argument('ignore-certificate-errors')
  options.add_argument('disable-popup-blocking')
  options.add_argument('disable-translate')
  options.add_argument('window-size=1600,900')
  options
end

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.default_max_wait_time = 10
  config.app_host = 'http://lojaebac.ebaconline.art.br'
end
