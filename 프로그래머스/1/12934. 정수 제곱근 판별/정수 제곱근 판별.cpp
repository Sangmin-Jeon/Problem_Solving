#include <string>
#include <vector>
#include "math.h"

using namespace std;

long long solution(long long n) {
    double answer = sqrt(n);
    return (floor(answer) == answer) ? (long long)(pow(answer + 1, 2)) : -1;
}