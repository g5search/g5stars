module StarsHelper
  def represent_star(star, options={})
    if star.board_member == true
     image_tag 'blue-star.png', width: 32, title: star.activity.name
    elsif star.activity.name.downcase.include? "blood"
      image_tag 'red-star.png', width: 32, title: star.activity.name
    else
      puts "#{star.activity.name}"
      image_tag 'star.png', width: 32, title: star.activity.name 
    end
  end

  def represent_star_with_description(star)
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
        image_tag('star.png', {width: 32 }) +
        link_to(star.activity.name, activity_path(star.activity))
      end
    end
  end
end
