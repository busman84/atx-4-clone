class AddAuthorToGrowls < ActiveRecord::Migration
  def change
    add_column :growls, :author, :text
  end
end
