class point {
    public:
    double x, y, z;

    point () {}
    point (double x, double y, double z) { set (x, y, z); }

    inline void set (double x, double y, double z);

    double length ();

    point operator- (point& p);

    void print (void);
};