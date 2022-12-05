class point {
    private:
    double x, y, z;

    public:
    Point () {}
    Point (double x, double y, double z) { set (x, y, z); }

    void set (double x, double y, double z);

    double length ();

    Point operator- (Point& p);

    void print (void);
};