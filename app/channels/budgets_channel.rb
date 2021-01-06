class BudgetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'budget_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    raise NotImplementedError
  end
end
