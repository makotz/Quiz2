class AddDefaultOfUndoneToCompletionColumn < ActiveRecord::Migration
  def change
    change_column :requests, :completion, :text, default: "Undone"
  end
end
