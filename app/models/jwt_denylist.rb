# frozen_string_literal: true

# == Schema Information
#
# Table name: jwt_denylist
#
#  id         :bigint           not null, primary key
#  jti        :string           not null
#  expired_at :datetime         not null
#
# app/models/jwt_denylist.rb

class JwtDenylist < ApplicationRecord
    include Devise::JWT::RevocationStrategies::Denylist
  
    self.table_name = 'jwt_denylist'
  end
