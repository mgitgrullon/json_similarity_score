require "test_helper"
require_relative "../lib/json_utilities/compare"


class JsonSimilarityCompare < ActiveSupport::TestCase
  def setup
    @invalid_json = 1
    @valid_json1  = file_fixture("BreweriesMaster.json")
    @valid_json2  = file_fixture("BreweriesSample1.json")
    @valid_json3  = file_fixture("BreweriesSample2.json")
    @valid_json4  = file_fixture("BreweriesSample3.json")
    @valid_json5  = file_fixture("BreweriesSample4.json")
    @valid_json6  = file_fixture("BreweriesSample5.json")
  end

  test "validates if files are invalid" do
    params = {
      json1: @invalid_json,
      json2: @valid_json1
    }

    error = assert_raises(ArgumentError) { JsonUtilities::Compare.new(params) }
    assert_equal error.message, "Must be a valid file"
  end

  test "validates if files are valid and identical" do
    params = {
      json1: @valid_json1,
      json2: @valid_json1
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 1, json_comparison.score
  end

  test "validates if files are valid and 0.7933 identical" do
    params = {
      json1: @valid_json1,
      json2: @valid_json2
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 0.7933, json_comparison.score
  end

  test "validates if files are valid and 0.7851 identical" do
    params = {
      json1: @valid_json2,
      json2: @valid_json3
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 0.7851, json_comparison.score
  end

  test "validates if files are valid and 0.865 identical" do
    params = {
      json1: @valid_json3,
      json2: @valid_json4
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 0.8656, json_comparison.score
  end


 test "validates if files are valid and 0.8325 identical" do
    params = {
      json1: @valid_json4,
      json2: @valid_json5
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 0.8325, json_comparison.score
  end


 test "validates if files are valid and 0.8639 identical" do
    params = {
      json1: @valid_json5,
      json2: @valid_json6
    }

    json_comparison = JsonUtilities::Compare.new(params)
    assert_equal true, json_comparison.validate_files
    assert_equal 0.8639, json_comparison.score
  end
end
