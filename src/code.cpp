#include <Rcpp.h>
using namespace Rcpp;

double update(double x) {
  x = x + R::rnorm(0, 0.0005);
  if(x < 0) {
    x = 0;
  }
  if(x > 1) {
    x = 1;
  }
  return x;
}

// [[Rcpp::export]]
NumericMatrix damage_path(int iter) {

  NumericMatrix segments(iter, 5); // initially zero

  segments(0, 0) = 0.5;  // x0
  segments(0, 1) = 0.5;  // y0
  segments(0, 2) = 0.5;  // x1
  segments(0, 3) = 0.55; // y1
  segments(0, 4) = 0.5;  // shade

  for(int t = 1; t < iter; t++) {
    segments(t, 0) = update(segments(t-1, 2)); // x0
    segments(t, 1) = update(segments(t-1, 3)); // y0
    segments(t, 2) = update(segments(t-1, 2)); // x1
    segments(t, 3) = update(segments(t-1, 3)); // y1
    segments(t, 4) = update(segments(t-1, 4)); // shade
  }
  return segments;
}
