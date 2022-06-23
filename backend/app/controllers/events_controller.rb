# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    events = Event.all
    render json: { events: events }, each_serializer: EventSerializer, status: :ok
  end

  def create
    cat = Category.find_by(name: event_params[:category])
    event = Event.new(action: event_params[:action], penalty: event_params[:action], target: event_params[:target],
                      category: cat)
    if event.save
      render json: event, serializer: EventSerializer, status: :ok
    else
      render json: { errors: event.errors }, status: :unprocessable_entity
    end
  end

  def show
    event = Event.find_by(id: params[:id])
    if event
      render json: event, serializer: EventSerializer, status: :accepted
    else
      render json: { message: 'Event Not Found', event: event }, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect_to(events_path)
  end
end

def event_params
  params.require(:event).permit(:action, :penalty, :target, :category)
end
