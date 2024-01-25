# spec/models/user_model_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to validate_presence_of(:fullname) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:avatar) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_length_of(:fullname).is_at_most(30) }
  it { is_expected.to have_many(:line_items).dependent(:destroy) }
  it { is_expected.to have_many(:products).through(:line_items) }
  it { is_expected.to have_one(:cart).dependent(:destroy) }

  context 'validation avatar format' do
    it 'allows to set webp file as an avatar' do
      subject.attributes = attributes_for(:user)
      is_expected.to be_valid
    end

    it 'disallows to set webp file as an avatar' do
      subject.attributes = attributes_for(:user, :with_invalid_avatar)
      is_expected.to be_invalid
    end
  end
end
