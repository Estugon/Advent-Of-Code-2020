#include <iostream>
#include <vector>

using namespace std;
int main(int argc, char** args) {
    vector<int> numbers;
    getNumbers:
    int x = -1;
    cin >> x;
    if (x!=-1) {
        numbers.push_back(x);
        goto getNumbers;
    }

    int ix = 0, iy = 0, iz = 0;

    outerLoop:
    if (ix < numbers.size() -1) {
        ix++;
        iy = 0;
        innerLoop:
        if (iy < numbers.size() -1) {
            iy++;
            if (argc > 1) {
                iz = 0;
                evenInnererLoop:
                if (iz < numbers.size() -1) {
                    iz++;
                    if (numbers[ix] + numbers[iy] + numbers[iz] == 2020) {
                        cout << "Solution: " << (numbers[ix] * numbers[iy] * numbers[iz]) << '\n'; 
                        goto end;
                    }
                    goto evenInnererLoop;
                }
            } else if (numbers[ix] + numbers[iy] == 2020) {
                cout << "Solution: " << (numbers[ix] * numbers[iy]) << '\n'; 
                goto end;
            }
            goto innerLoop;
        }
        goto outerLoop;
    }

    end:
    return 1;
}