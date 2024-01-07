# spec/models/user_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to validate_presence_of(:fullname) }
  it { is_expected.to validate_length_of(:fullname).is_at_most(50) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:avatar) }
end
