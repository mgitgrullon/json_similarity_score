require 'json'
require 'jaro_winkler'

module JsonUtilities
  class Compare
    def initialize(params)
      @json1 = params[:json1].read
      @json2 = params[:json2].read
    rescue
      raise ArgumentError.new("Must be a valid file")
    end

    def validate_files
      json1_file = JSON.parse(@json1)
      json2_file = JSON.parse(@json2)
      

      (json1_file.is_a?(Hash) || json1_file.is_a?(Array)) &&
      (json2_file.is_a?(Hash) || json2_file.is_a?(Array))
    rescue
      false
    end

    # Compare the json using Jaro–Winkler distance algorithm
    def score
      JaroWinkler.distance(@json1, @json2).round(4)
    end
  end
end
