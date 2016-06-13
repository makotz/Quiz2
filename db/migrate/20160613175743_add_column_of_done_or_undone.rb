class AddColumnOfDoneOrUndone < ActiveRecord::Migration
  def change
    add_column :requests, :completion, :text
  end
end
