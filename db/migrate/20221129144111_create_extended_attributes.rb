class CreateExtendedAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :extended_attributes do |t|
      t.string :field, null: false
      t.string :value, null: false
      t.integer :partner

      t.references :extendable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
