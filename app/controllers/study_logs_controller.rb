class StudyLogsController < ApplicationController

  before_action :set_study_log, only: [:show, :edit, :update, :destroy]

  def index
    @study_logs = StudyLog.all
    render json: @study_logs
  end

  def show
    render json: @study_log
  end

  def create
    @study_log = StudyLog.new(study_log_params)
    if@study_log.save
      render json: @study_log, status: :created
    else
      render json: @study_log.errors, status: :unprosessable_entry
    end
  end

  def new
    @study_log = StudyLog.new
  end

  def edit
  end

  def update
    if @study_log.update(study_log_params)
      redirect_to @study_log
    else
      render 'edit'
    end
  end

  def destroy
    @study.log.destroy
    head :no_content
  end

  private

  # 共通のコード
  def set_study_log
    @study_log = StudyLog.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'study_log not found' }, status: :not_found
  end

  def study_log_params
    params.require(:sudy_log).permit(:title, :content, :duration)
  end

end
