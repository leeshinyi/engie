module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :address, :email, :mobile, :extended_attributes

      def extended_attributes
        object&.extended_attributes&.map do |attr|
          {
            field: attr.field,
            value: attr.value,
            partner: attr.partner
          }
        end
      end
    end
  end
end
