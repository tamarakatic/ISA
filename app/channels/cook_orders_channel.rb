# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CookOrdersChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "cook_orders"
  end
end
