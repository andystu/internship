class InternsController < ApplicationController
  before_action :set_intern, only: [:show, :edit, :update, :destroy, :applyfor, :applylist, :clone]
  before_action :authenticate_user!
  before_action :user_ready, except: [:index]

  respond_to :html

  def index
    @interns = Intern.all.order("endtime desc")
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
    respond_with(@intern, location: interns_url)
  end

  def update
    @intern.update(intern_params)
    respond_with(@intern, location: interns_url)
  end

  def destroy
    @intern.destroy
    respond_with(@intern)
  end

  def applyfor
    if current_user.already_applied(@intern)
      redirect_to interns_url, flash: { alert: "#{@intern.title} 之實習已申請過囉!" }
    else
      current_user.requests.create(intern: @intern)
      respond_with @intern do |format|
        format.html {redirect_to interns_url, flash: { notice: "#{@intern.title} 之實習已登記完成" } }
      end
    end
  end

  def applylist
    if current_user.admin
      @interns = @intern.users
      respond_with(@interns)
    else
      redirect_to interns_url
    end
  end

  def clone
    if current_user.admin
      @clone_intern = @intern.dup
      @clone_intern.title = "#{@clone_intern.title}_new_#{Date.today}" 
      if @clone_intern.save
        redirect_to interns_url, notice: "#{@intern.title} 之實習複製成功"
      else
        redirect_to interns_url, alert: "#{@intern.title} 之實習複製失敗"
      end
    else
      redirect_to interns_url
    end
  end

  private
    def set_intern
      @intern = Intern.find(params[:id])
    end

    def intern_params
      params.require(:intern).permit(:title, :starttime, :endtime, :description, :url)
    end

    def user_ready
      unless current_user.name.present?
        redirect_to edit_user_registration_path, flash: { alert: "請先將必填的資料填寫完整喔!" }
      end
    end
end
