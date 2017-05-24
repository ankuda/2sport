module BooksHelper
  def time_cell(time, i)

    "#{ (time + i.hours).strftime('%H:%M') } - #{ (time + (i + 1).hours).strftime('%H:%M') }"
  end
end
