# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  fullname           :string
#  avatar_data        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#

# app/models/user.rb
# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  include ImageUploader::Attachment(:avatar)

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_FORMAT = /\A(?=.*[a-z])(?=.*\d).{8,}\z/i.freeze

  validates :avatar, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT }
  validates :fullname, presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password, format: { with: PASSWORD_FORMAT }, on: :create
end
