#include <iostream>

using namespace std;
static void usage(const char *reason);

int main(int argc, char *argv[])
{
    usage(7);
    return 0;
}

static void usage(const char *reason)
{
   if (reason && *reason) {
       printf("%s", reason);
   }

   printf("usage: position_estimator_inav {start|stop|status} [-v]\n");
   return;
}
