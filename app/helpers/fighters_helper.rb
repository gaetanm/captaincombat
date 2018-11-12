module FightersHelper
  def fighter_avatar(fighter)
    if fighter.is_a?(FighterNullObject) || !fighter.avatar.attached?
      img = Fighter::DEFAULT_AVATAR_IMG
    else
      img = fighter.avatar
    end
    image_tag img, size: "200x200"
  end
end