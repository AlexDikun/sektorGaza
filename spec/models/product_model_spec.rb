# spec/models/product_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_numericality_of(:price).is_other_than(0) }
  it { is_expected.to validate_length_of(:title).is_at_most(50) }
  it { is_expected.to validate_length_of(:body).is_at_most(500) }
  it { is_expected.to have_many(:categorizations) }
  it { is_expected.to have_many(:categories).through(:categorizations) }
  it { is_expected.to have_many(:line_items).dependent(:destroy) }

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
