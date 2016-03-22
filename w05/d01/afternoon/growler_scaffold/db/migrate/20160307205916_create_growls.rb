class CreateGrowls < ActiveRecord::Migration
  def change
    create_table :growls do |t|
      t.text :message

      t.timestamps null: false
    end
  end
end
