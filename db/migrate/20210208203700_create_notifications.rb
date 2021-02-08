class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :notifying,    foreign_key:  {to_table: :users}
      t.references :notified_by,  foreign_key:  {to_table: :users}
      t.references :tweet,        foreign_key:  true
      t.boolean    :read,         default:      false
      t.timestamps
    end
  end
end
