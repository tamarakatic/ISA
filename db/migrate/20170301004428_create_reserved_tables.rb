class CreateReservedTables < ActiveRecord::Migration[5.0]
  def change
    create_table :reserved_tables do |t|

      t.timestamps
    end
  end
end
