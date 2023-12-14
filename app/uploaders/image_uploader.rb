# app/uploaders/image_uploader.rb
# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_extension %w[jpg jpeg png webp]
  end
end
