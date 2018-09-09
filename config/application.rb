require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Visionhealthandfitness
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
  end
end
