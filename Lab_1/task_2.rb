#1

def is_simple(x)
  result=true
  if x==1
    result=false
  end
  if x==2
    result=true
  end
  cur_del=2
  while cur_del<x
    if x%cur_del==0
      result=false
    end
    cur_del+=1
  end
  result
end
def sum_digits(x)
  sum=0
  cur_del=2
  while cur_del<x
    if x%cur_del==0 and is_simple(cur_del)==true
      sum+=cur_del
    end
    cur_del+=1
  end
  p sum
end

#2

def count_special_digits(x)
  count=0
  while x>0
    if (x%10)>3 && (x%10)%2!=0
      count+=1
    end
    x/=10
  end
  p count
end
