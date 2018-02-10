# This migration creates the `versions` table, the only schema PT requires.
# All other migrations PT provides are optional.
class CreateVersions < ActiveRecord::Migration[5.1]

  # The largest text column available in all supported RDBMS is
  # 1024^3 - 1 bytes, roughly one gibibyte.  We specify a size
  # so that MySQL will use `longtext` instead of `text`.  Otherwise,
  # when serializing very large objects, `text` might not be big enough.
  TEXT_BYTES = 1_073_741_823

  def change
    opts = 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci'

    create_table :versions, { options: opts } do |table|
      table.string   :item_type, { null: false, limit: 191 }
      table.integer  :item_id,   null: false
      table.string   :event,     null: false
      table.string   :whodunnit
      table.text     :object, limit: TEXT_BYTES
      table.datetime :created_at
    end

    add_index :versions, %i(item_type item_id)
  end
end
