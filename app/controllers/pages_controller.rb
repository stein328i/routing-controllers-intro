class PagesController < ApplicationController
  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "big fat momma"

  end

  def about
    render :about
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to "/welcome"
  end

  def secrets
    magic_code = params[:magic_word]
    if magic_code == "boo"
      redirect_to '/welcome'
    else
      flash[:alert] = "Sorry, you're not authorized to see that page!"
      redirect_to '/kitten/500'
    end
  end

  def kitten
  end

  def kittens
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end

end
