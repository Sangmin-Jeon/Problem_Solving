package main

func solution(arr []int) float64 {
	sum := 0
	for i := 0; i < len(arr); i++ {
		sum += arr[i]
	}

	result := float64(sum) / float64(len(arr))
	return result
}
