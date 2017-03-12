#write your code here
def ftoc(f)
  c = (5.0 * (f.to_f - 32.0)) / 9.0
  return c
end

def ctof(c)
  f = 32.0 + ((9.0 * c.to_f) / 5.0)
  return f
end
