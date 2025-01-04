require "test_helper"

class StudyLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_log = study_logs(:one)
  end

  test "should get index" do
    get study_logs_url, as: :json
    assert_response :success
  end

  test "should create study_log" do
    assert_difference("StudyLog.count") do
      post study_logs_url, params: { study_log: { title: "New Log", content: "Testing", duration: 2 } }, as: :json
    end
    assert_response :created
  end

  test "should show study_log" do
    get study_log_url(@study_log), as: :json
    assert_response :success
  end

  test "should update study_log" do
    patch study_log_url(@study_log), params: { study_log: { title: "Updated Log" } }, as: :json
    assert_response :success
  end

  test "should destroy study_log" do
    assert_difference("StudyLog.count", -1) do
      delete study_log_url(@study_log), as: :json
    end
    assert_response :no_content
  end
end
