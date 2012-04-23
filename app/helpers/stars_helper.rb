module StarsHelper
  def represent_star(star)
    if star.board_member == true
      link_to activity_path(star.activity) do
        image_tag 'blue-star.png', width: 32, title: star.activity.name
      end
    elsif star.activity.name.downcase.include? "blood"
      image_tag 'red-star.png', width: 32, title: star.activity.name
    else
      puts "#{star.activity.name}"
      image_tag 'star.png', width: 32, title: star.activity.name 
    end
  end
end
