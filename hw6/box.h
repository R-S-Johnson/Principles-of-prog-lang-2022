#include <string.h>

class box: public shape {
    private:
    dobule length, width, height;
    string tbcolor;
    
    public:
    box (string type, string color, string tbcolor, double length, double width, double height, Point loc);
};