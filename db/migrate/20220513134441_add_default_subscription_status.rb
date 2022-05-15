class AddDefaultSubscriptionStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :status, :integer, default: 1
  end
end
