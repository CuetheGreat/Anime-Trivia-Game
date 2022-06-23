class GameController < ApplicationController
  @@game = []

  def new_game
    @@game.clear
    draw_card
  end

  def draw_card
    random = Event.random
    if !@@game.include?(random)
      draw = random
    else
      draw = Event.random while @@game.include?(draw)
    end
    @@game << draw

    if @@game.length >= Event.count
      render json: { message: 'Game Over' }, status: :ok
    else
      render json: { current: EventSerializer.new(@@game.last), played: @@game }, status: :ok
    end
  end

  def played_cards
    render json: @@game, each_serializer: EventSerializer, status: :ok
  end
end
