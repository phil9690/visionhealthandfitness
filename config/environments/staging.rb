require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do
  config.middleware.insert_after(::Rack::Runtime, ::Rack::Auth::Basic, "staging") do |u, p|
    [u, p] == [ENV['STAGING_USER'], ENV['STAGING_PASS']]
  end
end
