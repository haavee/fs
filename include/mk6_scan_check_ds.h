/* mk6 scan_check data structures */

struct mk6_scan_check_mon {

  /* M6 scan check monitor parameters */

  struct {
    long scan;
    struct m5state state;
  } scan;
  struct {
    char label[65];
    struct m5state state;
  } label;
  struct {
    char type[33];
    struct m5state state;
  } type;
  struct {
    int code;
    struct m5state state;
  }  code ;
  struct {
    struct m5time start;
    struct m5state state;
  } start;
  struct {
    struct m5time length;
    struct m5state state;
  } length;
  struct {
    float total;
    struct m5state state;
  } total;
  struct {
    long long missing;
    struct m5state state;
  } missing ;
  struct {
    char error[33];
    struct m5state state;
  } error;

};