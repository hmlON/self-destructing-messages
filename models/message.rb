class Message < ActiveRecord::Base

  def destroyed_after_time?
    visits_remaining.nil?
  end

  def destroyed_via_link_visits?
    !destroyed_after_time?
  end

  def time_remaining
    if destroyed_after_time?
      seconds = 1.hour - (Time.now - created_at)
      Time.at(seconds).strftime('%H:%M:%S')
    end
  end

  private

    def encrypt

    end

    def decrypt

    end

end
