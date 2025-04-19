class AddCompanyToRewards < ActiveRecord::Migration[8.0]
  def change
    add_reference :rewards, :company, foreign_key: true
  end
end
