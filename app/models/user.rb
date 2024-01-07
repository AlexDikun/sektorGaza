# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  fullname           :string
#  email              :string
#  avatar_data        :text
#  encrypted_password :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# app/models/user.rb
# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  include ImageUploader::Attachment(:avatar)

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_FORMAT = /\A(?=.*[a-z])(?=.*\d).{8,}\z/i.freeze

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT, message: 'Invalid email!' }
  validates :fullname, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password, format: { with: PASSWORD_FORMAT,
                                 message: 'Invalid password!' }, on: :create
  validates :avatar, presence: true
end
