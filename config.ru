require './application'
require 'redis'
require 'open-uri'
require 'rss'
require 'json'
require 'active_support/core_ext'


SampleAppCrampAndRedis::Application.initialize!

# Development middlewares
if SampleAppCrampAndRedis::Application.env == 'development'
  use AsyncRack::CommonLogger

  # Enable code reloading on every request
  use Rack::Reloader, 0

  # Serve assets from /public
  use Rack::Static, :urls => ["/javascripts"], :root => SampleAppCrampAndRedis::Application.root(:public)
end

# Running thin :
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -R config.ru start
#
# Vebose mode :
#
#   Very useful when you want to view all the data being sent/received by thin
#
#   bundle exec thin --max-persistent-conns 1024 --timeout 0 -V -R config.ru start
#
run SampleAppCrampAndRedis::Application.routes
