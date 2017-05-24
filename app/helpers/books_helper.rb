module BooksHelper
  def time_cell(time, i)

    "#{ (time + i.hours).strftime('%H:%M') } - #{ (time + (i + 1).hours).strftime('%H:%M') }"
  end

  def unavailable_time?(day, time)
    booked_time = @product.reservations.collect(&:time).select { |x| x.to_date == day }
    booked_time.map { |x| x.strftime("%H:%M") }.include?(time.split(' ').first)
  end
end
