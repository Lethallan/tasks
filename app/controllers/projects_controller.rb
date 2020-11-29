class ProjectsController < ApplicationController
  def index
    render json: projects.to_json
  end

  private

  def projects
    Project.all.map do |project|
      {
        id:    project.id,
        title: project.title,
        todos: project.todos.map do |todo|
          {
            id:          todo.id,
            text:        todo.text,
            isCompleted: todo.isCompleted
          }
        end
      }
    end
  end
end
