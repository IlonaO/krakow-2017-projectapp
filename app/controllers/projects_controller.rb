class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: 'Project was succesfully created.'
    else
      redirect_to projects_path, notice: 'Something is broken.'
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_path, notice: 'Project was succesfully updated.'
    else
      redirect_to projects_path, notice: 'Something is broken.'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end