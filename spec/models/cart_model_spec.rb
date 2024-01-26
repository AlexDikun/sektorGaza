# spec/models/cart_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:line_items).dependent(:destroy)  }
  it { is_expected.to have_many(:products).through(:line_items) }
end
