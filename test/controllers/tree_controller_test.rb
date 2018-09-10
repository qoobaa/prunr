require "test_helper"

class TreeControllerTest < ActionDispatch::IntegrationTest
  test "returns not found if a tree doesn't exist" do
    VCR.use_cassette("nonexisting") do
      get "/tree/nonexisting"
    end
    assert_response :not_found
  end

  test "returns the whole tree if exists and no indicator ids given" do
    VCR.use_cassette("input") do
      get "/tree/input"
    end
    assert_response :ok
    expected = JSON.parse(file_fixture("input.json").read)
    actual = JSON.parse(response.body)
    assert_equal expected, actual
  end

  test "returns a filtered tree if a tree exists and indicator ids given" do
    VCR.use_cassette("input") do
      get "/tree/input", params: {indicator_ids: [31, 32, 1]}
    end
    assert_response :ok
    expected = JSON.parse(file_fixture("controller_output1.json").read)
    actual = JSON.parse(response.body)
    assert_equal expected, actual
  end
end
