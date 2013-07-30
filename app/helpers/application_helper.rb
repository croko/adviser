module ApplicationHelper

  def rating_box(rating)
    rating ||= 0.0
    stars = []
    (1..5).each do |i|
      if i <= rating + 0.335
        stars << image_tag('star_activ.png')
      elsif i - rating > 0.335 and i - rating < 0.665
        stars << image_tag('half_star_activ.png')
      else
        stars << image_tag('star_inactiv.png')
      end
    end
    raw stars.join
  end

end
