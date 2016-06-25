module GroupsHelper

  def nearby(longitude1, latitude1, longitude2, latitude2)
    if (longitude1-longitude2).abs <= 0.01 && (latitude1-latitude2).abs <= 0.01
      return true
    else
      return false
    end 
  end 
end
