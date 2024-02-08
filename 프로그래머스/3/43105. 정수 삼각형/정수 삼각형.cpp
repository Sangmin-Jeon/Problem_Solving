#include <string>
#include <algorithm>
#include <vector>

using namespace std;

int solution(vector<vector<int>> triangle) {
    int height = triangle.size();
    vector<vector<int>> dp = triangle;

    for (int depth = height - 2; depth >= 0; --depth) {
        for (int idx = 0; idx <= depth; ++idx) {
            dp[depth][idx] += max(dp[depth + 1][idx], dp[depth + 1][idx + 1]);
        }
    }
    
    return dp[0][0];
}

