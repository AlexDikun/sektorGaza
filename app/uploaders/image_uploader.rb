# app/uploaders/image_uploader.rb
# frozen_string_literal: true

require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :derivatives
  plugin :determine_mime_type

  Attacher.validate do
    validate_extension %w[jpg jpeg png webp]
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      product_image: magick.resize_to_limit!(400, 400),
      user_avatar: magick.resize_to_limit!(100, 100)
    }
  end
end
