class EventsController < ApplicationController
  def index
    event = Event.all

    render json: event
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event, status: :ok
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Event.find(params[:id]).destroy

    head :no_content
  end

  private

  def event_params
    params.require(:event)
      .permit(:end_date, :start_date, :time, :address, :theme, :details,
      :image_data, :event_type, :status, :user_id)
  end
end
