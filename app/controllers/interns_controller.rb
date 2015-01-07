class InternsController < ApplicationController
  before_action :set_intern, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @interns = Intern.all
    respond_with(@interns)
  end

  def show
    respond_with(@intern)
  end

  def new
    @intern = Intern.new
    respond_with(@intern)
  end

  def edit
  end

  def create
    @intern = Intern.new(intern_params)
    @intern.save
    respond_with(@intern)
  end

  def update
    @intern.update(intern_params)
    respond_with(@intern)
  end

  def destroy
    @intern.destroy
    respond_with(@intern)
  end

  private
    def set_intern
      @intern = Intern.find(params[:id])
    end

    def intern_params
      params.require(:intern).permit(:title, :starttime, :endtime, :description, :url)
    end
end
