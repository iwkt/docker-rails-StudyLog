class StudyLogsController < ApplicationController
  def index
    @study_logs = StudyLog.all
  end

  def new
    @study_log = StudyLog.new
  end

  def create
    @study_log = StudyLog.new(study_log_params)
    if @study_log.save
      redirect_to study_logs_path, notice: '学習記録が作成されました。'
    else
      flash.now[:alert] = 'エラーが発生しました。'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def study_log_params
    params.require(:study_log).permit(:title, :content, :duration)
  end
end
