module Api
  class StudyLogsController < ApplicationController
    # JSONで一覧を返す
    def index
      @study_logs = StudyLog.all
      render json: @study_logs, status: :ok
    end

    # JSONで新しいデータを作成
    def create
      @study_log = StudyLog.new(study_log_params)
      if @study_log.save
        render json: @study_log, status: :created
      else
        render json: { errors: @study_log.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # JSONで特定のデータを返す
    def show
      @study_log = StudyLog.find(params[:id])
      render json: @study_log, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "データが見つかりません" }, status: :not_found
    end

    private

    def study_log_params
      params.require(:study_log).permit(:title, :content, :duration)
    end
  end
end
