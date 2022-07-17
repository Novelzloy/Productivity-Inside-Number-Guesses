//
//  CountingLogicPlayer.swift
//  Productivity Inside Test
//
//  Created by Роман on 14.07.2022.
//

import Foundation

class CountingLogicPlayer {
    
    static func recursiveBinarySearch(nums: [Int], target: Int) -> Int? {
      func _recursiveBinarySearch(nums: [Int], target: Int, start: Int, end: Int) -> Int? {
        guard start <= end else {
          return nil
        }
    
        let midIndex = (start+end)/2
        let mid = nums[midIndex]
        
        if mid == target {
          return midIndex
        } else if target < mid {
          return _recursiveBinarySearch(nums: nums, target: target, start: start, end: midIndex - 1)
        } else {
          return _recursiveBinarySearch(nums: nums, target: target, start: midIndex + 1, end: end)
        }
      }
      return _recursiveBinarySearch(nums: nums, target: target, start: 0, end: nums.count - 1)
    }
}
