# spec/models/category_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { build(:category) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(30) }
  it { is_expected.to validate_length_of(:description).is_at_most(100) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:product_categorizations).with_foreign_key(:product_id).class_name('Categorization') }
  it { is_expected.to have_many(:products).through(:product_categorizations).source(:product) }
end
