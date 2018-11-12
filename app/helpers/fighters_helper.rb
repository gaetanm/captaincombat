module FightersHelper
  def fighter_avatar(fighter)
    img = fighter && fighter.avatar.attached? ? fighter.avatar : "avatar.jpg"
    image_tag img, size: "200x200"
  end
end