class CompareController < ApplicationController
  after_action :clear_score, only: :index

  def index
    @score ||= session[:score]
  end

  def create
    json_comparison = JsonUtilities::Compare.new(person_params)

    if json_comparison.validate_files
      session[:score] = json_comparison.score
    else
      flash[:error] = "Invalid json file comparison."
    end
    redirect_to action: :index
  end

  private

  def clear_score
    session.delete(:score)
  end

  def person_params
    params.permit(:json1, :json2)
  end
end