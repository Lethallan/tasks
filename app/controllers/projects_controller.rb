class ProjectsController < ApplicationController
  before_action :find_project, only: :index

  def index
    # render json: { message: "ok" }
    @projects = Project.all
    @todos = @project.todos
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
