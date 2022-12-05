#include "sphere.h"

sphere::sphere(string type, string color, Point center, double radius) {
    type = type;
    color = color;
    center = center;
    radius = radius;
    loc = center;
}

virtual double compute_volume() {
    return (4/3 * 3.14 * radius * radius * radius);
}