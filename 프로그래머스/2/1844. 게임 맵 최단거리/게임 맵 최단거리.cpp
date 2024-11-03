#include <iostream>
#include <vector>
#include <queue>
#include <tuple>

using namespace std;

typedef vector<int> Matrix1D;
typedef vector<Matrix1D> Matrix2D;

int bfs(Matrix2D &maps) {
    Matrix2D visited(maps.size(), Matrix1D(maps[0].size(), 1));
    queue<tuple<int, int, int>> queue;
    const Matrix1D dr{0, 1, 0, -1};
    const Matrix1D dc{-1, 0, 1, 0};

    tuple<int, int, int> start_point = make_tuple(0, 0, 1);
    queue.push(start_point);
    visited[get<0>(start_point)][get<1>(start_point)] = 0;

    while (!queue.empty()) {
        const tuple<int, int, int> current = queue.front();
        queue.pop();

        const int r = get<0>(current), c = get<1>(current), l = get<2>(current);

        for (int i = 0; i < dr.size(); i++) {
            const int _r = r + dr[i];
            const int _c = c + dc[i];

            if (0 <= _r && _r < maps.size() && 0 <= _c && _c < maps[0].size() && visited[_r][_c] != 0 && maps[_r][_c] == 1) {
                if (_r == maps.size() - 1 && _c == maps[0].size() - 1 ) {
                    return l + 1;
                }
                queue.push(make_tuple(_r, _c, l + 1));
                visited[_r][_c] = 0;
            }
        }

    }

    return -1;
}

int solution(Matrix2D maps) {
    return bfs(maps);
}