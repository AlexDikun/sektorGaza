# spec/models/categorization_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categorization, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to :product }
  it do
    should validate_uniqueness_of(:category_id)
      .scoped_to(:product_id).case_insensitive
  end
  it do
    should validate_uniqueness_of(:product_id)
      .scoped_to(:category_id).case_insensitive
  end

  let(:category) { create :category }
  let(:product) { create :product }
  let(:categorization) do
    create :categorization, category: category, product: product
  end

  subject { categorization }

  it { should be_valid }

  context 'when category id is not present' do
    before { categorization.category_id = nil }
    it { should_not be_valid }
  end

  context 'when product id is not present' do
    before { categorization.product_id = nil }
    it { should_not be_valid }
  end
end
