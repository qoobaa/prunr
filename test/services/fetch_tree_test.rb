require "test_helper"

class FetchTreeTest < ActiveSupport::TestCase
  test "fetches tree even if server responds once with 500" do
    VCR.use_cassette("servererror") do
      assert_equal JSON.parse(file_fixture("input.json").read), FetchTree.call("input")
    end
  end

  test "raises an exception when server responds with 500 too many times" do
    VCR.use_cassette("toomanyservererrors") do
      assert_raises(FetchTree::ApiError) { FetchTree.call("input") }
    end
  end

  test "returns nil if a tree doesn't exist" do
    VCR.use_cassette("nonexisting") do
      assert_nil FetchTree.call("nonexisting")
    end
  end
end
