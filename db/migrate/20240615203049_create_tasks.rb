class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, index: true
      t.text :description
      t.date :due_date, index: true
      t.string :status, null: false, default: 'pending', index: true
      t.belongs_to :creator, index: true, null: false
      t.belongs_to :assignee, index: true
      t.belongs_to :assigner, index: true

      t.check_constraint "status IN ('pending', 'in progress', 'completed')"

      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :creator_id
    add_foreign_key :tasks, :users, column: :assignee_id
    add_foreign_key :tasks, :users, column: :assigner_id
  end
end
