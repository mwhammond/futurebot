class AddDatefoundToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :datefound, :date
  end
end
