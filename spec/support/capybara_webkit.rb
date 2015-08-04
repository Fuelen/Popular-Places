Capybara::Webkit.configure do |config|
  # Enable debug mode. Prints a log of everything the driver is doing.
  # config.debug = true

  # By default, requests to outside domains (anything besides localhost) will
  # result in a warning. Several methods allow you to change this behavior.

  # Silently return an empty 200 response for any requests to unknown URLs.
  config.block_unknown_urls

  # Allow pages to make requests to any URL without issuing a warning.
  # config.allow_unknown_urls

  # Don't load images
  config.skip_image_loading
end
