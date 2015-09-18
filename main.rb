require 'capybara'
require 'byebug'
require 'headless'
include Capybara::DSL

WAIT_SECONDS = 120
SCREENS_QUANTITY = 15
URL_SEPARATOR = "/#"
START_TIME = Time.now
TEST_URL = "http://google.com.ua"
IMAGES_PATH = ".//a[@class='module module--screenshot module--screenshot-loaded']"

headless = Headless.new
headless.start

Capybara.configure do |config|
  config.run_server = true
  config.ignore_hidden_elements = false
  config.default_driver = :selenium
  config.app_host   = 'https://dev.modern.ie/tools/screenshots'
end

visit "/" + URL_SEPARATOR + TEST_URL

def get_href id
  find(:id, id)[:href]
end

def ending_time sec
  Time.at(START_TIME.to_i + sec)
end

def print_url platform, screen_id
  puts "#{ platform } -- #{ get_href('screenshot0') }"
end

# Waiting for all screenshots on page
while all(:xpath, IMAGES_PATH).length != SCREENS_QUANTITY
  break if Time.now > ending_time(WAIT_SECONDS)
end

print_url("IE 11.0 Win 8.1","screenshot0")
print_url("Chrome 42.0 Win 8.1", "screenshot1")
print_url("FireFox 37.0 Win 8.1", "screenshot2")
print_url("Safari 7.1", "screenshot3")
print_url("Safari 6.0", "screenshot4")
print_url("Opera 12.16 Win 8.1", "screenshot5")
print_url("IE 10 Win 7", "screenshot6")
print_url("IE 9 Win 7", "screenshot7")
print_url("IE 8 Win 7", "screenshot8")
print_url("IE 7 Win XP", "screenshot9")
print_url("IE 6 Win XP", "screenshot10")
print_url("Nexus 6 Android 5", "screenshot11")
print_url("Nexus 9 Android 5", "screenshot12")
print_url("iPhone 6 IOS 8.3", "screenshot13")
print_url("iPad Air IOS 8.3", "screenshot14")

headless.destroy
