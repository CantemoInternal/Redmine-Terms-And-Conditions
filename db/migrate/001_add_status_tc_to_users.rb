class AddStatusTcToUsers < ActiveRecord::Migration
  def self.up
  	add_column :users, :status_tc, :boolean,:default=>0
  end

 def self.down
    remove_column :users, :status_tc
  end
end


