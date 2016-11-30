class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_game

  # Loads and keeps the current game
  def current_game
    @current_game ||= load_current_game
  end

  # Sets both the @current_game variable & the session's 
  # serialized current game with the given game
  def set_current_game(game)
    @current_game = game
    session[:serialized_current_game] = game.present? ? game.to_json : nil
  end

  # Serialize the current game to session
  def update_current_game
    set_current_game @current_game
  end

  protected

  def load_current_game
    Game.new.from_json(session[:serialized_current_game]) if session[:serialized_current_game].present?
  end

end
