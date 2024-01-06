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
class UserSerializer
  include JSONAPI::Serializer
  attributes :fullname, :email, :avatar
end
