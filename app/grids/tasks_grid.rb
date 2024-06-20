class TasksGrid
  include Datagrid

  scope do
    Task
  end

  filter(:status, :enum, select: ['pending', 'in progress', 'completed'])

  column :title, html: true do |task|
    link_to task.title, task_path(task)
  end
  column :due_date
  column :status
  column :creator do
    self.creator.email
  end
  column :assigner do
    self.assigner&.email || '-'
  end
  column :assignee do
    self.assignee&.email || '-'
  end
end
