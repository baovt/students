module BlogsHelper
  def show_time(t)
    t.strftime("%d/%m/%Y %H:%M")
  end
end
