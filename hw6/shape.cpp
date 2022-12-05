#include "shape.h"
#include <iostream>

shape::shape(string type, string color, point loc) {
    type = type;
    color = color;
    loc = loc;
}

void shape::print_color() {
    std.cout << "Color: " << color << std.endl;
}

void shape::print_type() {
    std.cout << type << std.endl;
}

void shape::print_loc() {
    std.cout << loc << std.endl;
}