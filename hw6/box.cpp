#include "box.h"
#include <iostream>

box::box(string type, string color, string tbcolor, double length, double width, double height, Point loc) {
    type = type;
    color = color;
    tbcolor = tbcolor;
    loc = loc;
    length = length;
    width = width;
    height = height;
}

virtual void box::print_color() {
    std::cout << "Side Color: " << color << "Top/Base Color: " << tbcolor << std::endl;
}

virtual double box::compute_volume() {
    return (length * width * height);
}