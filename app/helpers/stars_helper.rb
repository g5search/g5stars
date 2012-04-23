module StarsHelper
  def represent_star(star)
    if star.board_member == true
      link_to activity_path(star.activity) do
        image_tag 'blue-star.png', {width: 32 }
      end
    else
      image_tag 'star.png', {width: 32 }
    end
  end
end
