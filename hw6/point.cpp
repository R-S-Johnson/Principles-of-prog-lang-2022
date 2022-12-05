#include "point.h"
#include <cmath>
#include <iostream>

inline void point::set(double x, double y, double z) {
    x = x;
    y = y;
    z = z;
}

double point::length() {
    return sqrt(x*x + y*y + z*z);
}

point point::operator-(point& p) {
    point toreturn = new point();
    toreturn.set(this.x - p.x, this.y - p.y, this.z - p.z);
    return toreturn;
}

void print() {
    std::cout << "x: " << x << " y: " << y << " z: " << z << std::endl;
}