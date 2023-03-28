class RenameFlightsStartToDate < ActiveRecord::Migration[7.0]
  def change
    change_table :flights do |t|
      t.rename :start, :date
    end
  end
end
