require "test_helper"

class FilterThemesByIndicatorIdsTest < ActiveSupport::TestCase
  test "works when empty ids array given" do
    input = JSON.parse(file_fixture("input.json").read)
    assert_equal [], FilterThemesByIndicatorIds.call(input, [])
  end

  test "works when non-existing ids given" do
    input = JSON.parse(file_fixture("input.json").read)
    assert_equal [], FilterThemesByIndicatorIds.call(input, [666])
  end

  test "works when filtering a single category" do
    input = JSON.parse(file_fixture("input.json").read)
    output1 = JSON.parse(file_fixture("output1.json").read)
    assert_equal output1, FilterThemesByIndicatorIds.call(input, [305, 307])
  end

  test "works when filtering multiple categories" do
    input = JSON.parse(file_fixture("input.json").read)
    output2 = JSON.parse(file_fixture("output2.json").read)
    assert_equal output2, FilterThemesByIndicatorIds.call(input, [299, 301])
  end

  test "works when filtering multiple subthemes" do
    input = JSON.parse(file_fixture("input.json").read)
    output3 = JSON.parse(file_fixture("output3.json").read)
    assert_equal output3, FilterThemesByIndicatorIds.call(input, [299, 302])
  end

  test "works when filtering multiple themes" do
    input = JSON.parse(file_fixture("input.json").read)
    output4 = JSON.parse(file_fixture("output4.json").read)
    assert_equal output4, FilterThemesByIndicatorIds.call(input, [299, 308])
  end
end
