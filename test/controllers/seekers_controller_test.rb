require 'test_helper'

class SeekersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seekers_index_url
    assert_response :success
  end

end
