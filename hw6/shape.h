#include "point.h"
#include <string.h>

class shape {
    private:
    string type;
    point loc;
    protected:
    string color;
    public:
    shape *next;

    shape (string type, string color, point loc);

    virtual void print_color (void);

    virtual double compute_volume (void);

    void print_type (void);

    void print_loc (void);

};