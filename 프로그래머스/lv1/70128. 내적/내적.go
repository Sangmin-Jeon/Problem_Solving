package main

func solution(a []int, b []int) int {
	arr := []int{}
	for i := 0; i < len(a); i++ {
		arr = append(arr, a[i] * b[i])
	}

	sol := 0
	for i := 0; i < len(arr); i++ {
		sol += arr[i]
	}
	return sol
}