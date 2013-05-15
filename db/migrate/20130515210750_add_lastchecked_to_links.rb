class AddLastcheckedToLinks < ActiveRecord::Migration
  def change
    add_column :links, :lastchecked, :date
  end
end
