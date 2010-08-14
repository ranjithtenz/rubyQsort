#!/usr/bin/env ruby

class Array
  def partition(left, right, pivotIndex)
    pivotValue = self[pivotIndex]
    self[pivotIndex],self[right] = self[right],self[pivotIndex]
    storeIndex = left
    left.upto(right - 1) do |n|
      if self[n] <= pivotValue
	self[n], self[storeIndex] = self[storeIndex], self[n]
	storeIndex += 1
      end
    end
  self[storeIndex], self[right] = self[right], self[storeIndex]
  return storeIndex
  end

  def qsort(*opt)
    left = opt[0] ? opt[0] : 0
    right = opt[1] ? opt[1] : (self.length - 1)
    if right > left
      pivotIndex = left + ((right - left) / 2)
      pivotNewIndex = partition(left, right, pivotIndex)
      qsort(left, pivotNewIndex - 1)
      qsort(pivotNewIndex + 1, right)
    end
    return self
  end
end

array = Array[9, 6, 4, 23, 443, 2, 3]

array.each { |n| print "#{n} " }
puts ""

array.qsort

array.each { |n| print "#{n} " }
puts ""
