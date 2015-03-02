class Api::V1::TripsControllerController < ApplicationController
  before_action :set_trip, except: [:index]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def create
    @trip = Trip.create(decoded_params)
    render json: @trip
  end

  def update
    @trip.update_attributes(decoded_params)
    render json: @trip
  end

  def delete
    @trip.destroy
    render json: @trip
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def decoded_params
    ActiveSupport::JSON.decode(request.body.read)
  end


end
