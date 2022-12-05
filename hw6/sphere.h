#include "shape.h"
#include "point.h"

class sphere: public shape {
    private:
    point center;
    double radius;

    public:
    Sphere (string type, string color, Point center, double radius);
};