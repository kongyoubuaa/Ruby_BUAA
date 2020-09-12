# BUAA Ruby Programming Language 2020
#
# 对正整数n，用p(n)表示n的各位非0数字的乘积，如果n是个位数，则p(n)=n。求p(1)+p(2)+…+p(m)的最大质因数。
# 写一个尽量简短的Ruby程序实现解决上述问题
#
# Author : Yixing Ma

# Calculate the max prime
def primeFactors(number)
    if number == 1
        return 1
    end
    for i in 2...number
      if number % i == 0
          return (primeFactors(number/i))
      end
    end
    return number
end

# Main function
def mfp(m)
  # Func to calculate the sum - from Internet
  # puts (1..m).map{|i| i.to_s.chars.map(&:to_i).select{|v| v>0}.inject(&:*) }.inject(&:+)

  # Calculate the sum
  sum = 0
  m = m + 1
  for i in 1...m
    temp = i
    mul = 1
    while temp > 0
      bit = temp % 10
      if bit != 0
        mul = mul * bit
      end
      temp = temp / 10
    end
    sum = sum + mul
  end
  #puts sum

  # output the value of the max prime
  puts primeFactors(sum)

end

mfp(6)