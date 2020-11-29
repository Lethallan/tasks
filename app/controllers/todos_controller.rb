class TodosController < ApplicationController
  before_action :find_project, only: %i[new create]
  before_action :find_todo, only: %i[edit update]

  def new
    @todo = @project.todos.new
  end

  def create
    @todo = @project.todos.new(todo_params)

    if @todo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :isCompleted)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end
end
