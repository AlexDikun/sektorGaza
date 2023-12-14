# spec/models/product_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image) }
end
