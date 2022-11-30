# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  mobile     :string
#  street     :string
#  city       :string
#  state      :string
#  postcode   :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  extend CustomFinder

  has_many :extended_attributes, as: :extendable

  def address
    [street, city, state, postcode, country].compact.join(' ')
  end
end
