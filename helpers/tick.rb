module ServerTick
  def tick
    return {time: Time.now().to_i}
  end
end
