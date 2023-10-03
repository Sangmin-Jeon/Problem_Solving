const(
	fib0 = 0
	fib1 = 1
)
var memo = make(map[int]int)

func solution(n int) int {
	memo[0] = 0
	memo[1] = 1
	return dfs(n)
}

func dfs(n int) int {
	fib, exist := memo[n]
	if exist {
		return fib
	}
	
	memo[n] = dfs(n - 1) + dfs(n - 2)
	return (memo[n] % 1234567)

}