require 'test_helper'

class RandomArtifactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get random_artifact_index_url
    assert_response :success
  end

end
