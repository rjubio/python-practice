def string_match(a, b):
  n=0
  l=min(len(a),len(b))
  for i in range(l-1):
    x=a[i:i+2]
    y=b[i:i+2]
    if x==y:
      n = n+1
  return n

