#include <iostream>

using namespace std;


void read_objs (Shape **list)

{
   shape *node;         // variable used to create a new node each time through the loop
   double x, y, z, length, width, height, radius;  // temporary variables used to read in values; fill in the rest
   string type, color, tbcolor;     // temporary variables used to read in values; fill in the rest

   // initialize list
   *list = NULL;

   while (cin >> type) {

      if (type.compare ("sphere") == 0) {

         // fill in code here to read in the sphere values and create a new node
        cin >> x >> y >> z;
        point pnt = new point(x, y, z);
        cin >> radius;
        cin >> color;
        node = new sphere(type, color, pnt);
      }

      else if (type.compare ("box") == 0) {

         // fill in code here to read in the box values and create a new node
        cin >> length >> width >> height;
        cin >> x >> y >> z;
        point pnt = new point(x, y, z);
        cin >> color;
        cin >> tbcolor;
        node = new box(type, color, tbcolor, length, width, height, pnt);
      }
   
      else if (type.compare ("cone") == 0) {

         cin >> x >> y >> z >> xx >> yy >> zz >> rad >> color >> color2;

         node = new Cone (type, color, color2, Point (x, y, z), Point (xx, yy, zz), rad);
      }

      // link new node at front of list:
      //   set the next field of node to the beginning of the list (*list)
      //   set the beginning of the list to node
      node.next = *list;
      *list = node;
   }
}

void print_objs(shape list) {
    shape cur = list;
    do {
        cout << "Name: " << cur.print_type() << endl;
        cout << cur.print_color() << endl;
        cout << cur.print_location() << endl;
        cout << "Volume: " << cur.compute_volume() << endl;
    }
}



int main () {
 shape *list;
 read_objs (&list);
 print_objs (list);
 // add loop here to return any allocated space to the system
 return (0);
}