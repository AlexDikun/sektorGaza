# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  fullname    :string
#  avatar_data :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# app/models/user.rb
# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
        
  include ImageUploader::Attachment(:avatar)
end