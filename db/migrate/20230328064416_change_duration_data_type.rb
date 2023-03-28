class ChangeDurationDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :duration, :interval
  end
end
