# spec/models/product_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image) }

  context 'validation image format' do
    it 'allows to set webp file as an image' do
      subject.attributes = attributes_for(:product)
      is_expected.to be_valid
    end

    it 'disallows to set webp file as an image' do
      subject.attributes = attributes_for(:product, :with_invalid_image)
      is_expected.to be_invalid
    end
  end
end
