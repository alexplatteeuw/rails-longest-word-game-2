require 'json'
require 'open-uri'

class PagesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @attempt = params[:attempt]
    @grid = params[:grid]
    @result = test_word
  end

  private

  def test_word
    if !made_out_of_grid?
      session[:score] = 0
      "Sorry but #{@attempt.upcase} can't be build out of #{@grid.upcase.chars.join(', ')}"
    elsif !valid_english_word?
      session[:score] = 0
      "Sorry but #{@attempt.upcase} does not seem to be a valid English word"
    else
      session[:score].blank? ? session[:score] = @attempt.length : session[:score] += @attempt.length
      "Congratulations! #{@attempt.upcase} is a valid English word!"
    end
  end

  def made_out_of_grid?
    @attempt.chars - @grid.chars == []
  end

  def valid_english_word?
    url = "https://wagon-dictionary.herokuapp.com/#{@attempt}"
    attempt_serialized = open(url).read
    JSON.parse(attempt_serialized)["found"]
  end
end

