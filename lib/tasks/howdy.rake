task({:send_reminders=> :environment}) do
  p "howdy from custom rake task!"

  alert_not_sent_flights = Flight.where({:alert_sent=> false})

  cutoff_time = 24.hours.from_now + 15.minutes

  need_reminder_flights = alert_not_sent_flights.where("departs_at < ?", cutoff_time)

  need_reminder_flights.each do |a_flight|

    p a_flight.description
    p a_flight.departs_at

    #assume that we send a SMS to a_flight.user.phone_number with Twilio

    a_flight.alert_sent = true
    a_flight.save

  end



end