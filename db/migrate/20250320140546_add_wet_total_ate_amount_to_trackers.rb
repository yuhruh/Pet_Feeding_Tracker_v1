class AddWetTotalAteAmountToTrackers < ActiveRecord::Migration[8.0]
  def change
    # remove_column :pet_trackers, :wet_total_ate_amount
    add_column :pet_trackers, :wet_total_ate_amount, :decimal, precision: 5, scale: 2
  end
end
