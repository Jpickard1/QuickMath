#include <iostream>
#include <lapacke.h>

int main(int argc, char **argv) {
	double x[] = {1.0, 2.0, 3.0};
	double coef = 2.5;
	int one = 1;
	int n = 3;
	// cblas interface call
	// cblas_dscal(n, coef, x, one);
	for (int i = 0; i < n; i++) {
		std::cout << " " << x[i] << std::endl;
	}
	return 0;
}
