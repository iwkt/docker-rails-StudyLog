class ApplicationController < ActionController::API

    # 必須パラメータが不足している場合のエラーハンドリング
    rescue_from ActionController::ParameterMissing do |exception|
      render json: { error: exception.message }, status: :bad_request
    end
  
    # 他の例外も追加で処理可能
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: "Record not found: #{exception.message}" }, status: :not_found
    end
  
end
