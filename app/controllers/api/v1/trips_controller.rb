class Api::V1::TripsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trip, except: [:index, :create]
  before_action :set_headers

  def index
    @trips = Trip.all
    render json: @trips, each_serializer: TripsSerializer
  end

  def show
    update_posts
    render json: @trip
  end

  def create
    @trip = Trip.create!(trip_params.merge(user: current_user))
    render json: @trip
  end

  def update
    @trip.update_attributes(trip_params)
    render json: @trip
  end

  def destroy
    @trip.destroy
    render json: { "status" => "success", "message" => "#{@trip.name} was destroyed." }
  end

  private

  def update_posts
    Resque.enqueue(PostFetcher, @trip.start_date, @trip.end_date, "twitter", @trip.twitter_usernames)
    Resque.enqueue(PostFetcher, @trip.start_date, @trip.end_date, "instagram", @trip.instagram_usernames)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :name, :user_id)
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
