class LandingsController < ApplicationController
  def index
    if current_user.blank? 
      @unit = User::MLS.keys.first.to_s
    else
      @unit = current_user.unit
    end

   @leaders=User.leaders(params)
   @country = params[:country]

  end
end
