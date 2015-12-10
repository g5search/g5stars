module StarsHelper

  def star_image_tag(color, options={})
    options.reverse_merge!({width: 32})
    image_tag "#{color}-star.png", options
  end

  def represent_star(star, options={})
    return if star.activity.blank?
    if star.board_member == true
      star_image_tag('blue', {title: star.activity.name})
    elsif star.activity.name.downcase.include? "blood"
      star_image_tag('red', title: star.activity.name)
    else
      puts "#{star.activity.name}"
      star_image_tag('yellow', title: star.activity.name)
    end
  end

  def represent_star_with_description(star)
    return if star.activity.blank?
    if star.board_member == true
      content_tag :div do
        image_tag('blue-star.png', { width: 32 }) +
        link_to(star.activity.name, activity_path(star.activity))
      end
    elsif star.activity.name.downcase.include? "blood"
      content_tag :div do
        image_tag('red-star.png', { width: 32 }) +
        link_to(star.activity.name, activity_path(star.activity))
      end
    else
      content_tag :div do
        image_tag('yellow-star.png', {width: 32 }) +
        link_to(star.activity.name, activity_path(star.activity))
      end
    end
  end
end
