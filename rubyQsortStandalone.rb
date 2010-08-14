#!/usr/bin/env ruby

def partition(array, left, right, pivotIndex)
  pivotValue = array[pivotIndex]
  array[pivotIndex],array[right] = array[right],array[pivotIndex]
  storeIndex = left
  left.upto(right - 1) do |n|
    if array[n] <= pivotValue
      array[n], array[storeIndex] = array[storeIndex], array[n]
      storeIndex += 1
    end
  end
  array[storeIndex], array[right] = array[right], array[storeIndex]
  return storeIndex
end

def Qsort(array, *opt)
  left = opt[0] ? opt[0] : 0
  right = opt[1] ? opt[1] : (array.length - 1)
  if right > left
    pivotIndex = left + ((right - left) / 2)
    pivotNewIndex = partition(array, left, right, pivotIndex)
    Qsort(array, left, pivotNewIndex - 1)
    Qsort(array, pivotNewIndex + 1, right)
  end
  return array
end

array = Array[9, 6, 4, 23, 443, 2, 3]

array.each { |n| print "#{n} " }
puts ""

#Qsort(array, 0, array.length - 1)
Qsort(array)

array.each { |n| print "#{n} " }
puts ""
