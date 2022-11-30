# == Schema Information
#
# Table name: extended_attributes
#
#  id              :integer          not null, primary key
#  field           :string           not null
#  value           :json             not null
#  partner         :integer
#  extendable_type :string           not null
#  extendable_id   :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ExtendedAttribute < ApplicationRecord
  belongs_to :extendable, polymorphic: true

  enum partner: { partner_1: 1, partner_2: 2 }
end
