def make_bricks(small, big, goal):
  rem=goal%5
  if big*5+small < goal:
    return False
  else:
    if rem <= small:
      return True
    else:
      return False
  return False
    
