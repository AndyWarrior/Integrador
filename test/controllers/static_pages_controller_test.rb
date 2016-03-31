require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get reporte" do
    get :reporte
    assert_response :success
  end

end
