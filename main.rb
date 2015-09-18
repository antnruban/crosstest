require 'selenium-webdriver'
require 'capybara'
require 'byebug'
include Capybara::DSL

WAIT_TIME = 10.seconds
SCREENS_QUANTITY = 1
TOOL_SEPARATOR = "/#"
START_DATE = DateTime.now
TEST_URL = "http://google.com.ua"
IMAGES_PATH = ".//a[@class='module module--screenshot module--screenshot-loaded']"

Capybara.configure do |config|
  config.run_server = true
  config.ignore_hidden_elements = false
  config.default_driver = :selenium
  config.app_host   = 'https://dev.modern.ie/tools/screenshots'
end

visit "/" + TOOL_SEPARATOR + TEST_URL

def get_href id
  find(:id, id)[:href]
end

# Waiting for all screenshots on page
while all(:xpath, IMAGES_PATH).length != SCREENS_QUANTITY
  break if DateTime.now >= START_DATE + WAIT_TIME
end

puts "IE 11.0 Win 8.1 -- #{ get_href('screenshot0') }"
puts "Chrome 42.0 Win 8.1 -- #{ get_href('screenshot1') }"
puts "FireFox 37.0 Win 8.1 -- #{ get_href('screenshot2') }"
puts "Safari 7.1 -- #{ get_href('screenshot3') }"
puts "Safari 6.0 -- #{ get_href('screenshot4') }"
puts "Opera 12.16 Win 8.1 -- #{ get_href('screenshot5') }"
puts "IE 10 Win 7-- #{ get_href('screenshot6') }"
puts "IE 9 Win 7 -- #{ get_href('screenshot7') }"
puts "IE 8 Win 7 -- #{ get_href('screenshot8') }"
puts "IE 7 Win XP -- #{ get_href('screenshot9') }"
puts "IE 6 Win XP -- #{ get_href('screenshot10') }"
puts "Nexus 6 Android 5 -- #{ get_href('screenshot11') }"
puts "Nexus 9 Android 5 -- #{ get_href('screenshot12') }"
puts "iPhone 6 IOS 8.3 -- #{ get_href('screenshot13') }"
puts "iPad Air IOS 8.3 -- #{ get_href('screenshot14') }"
