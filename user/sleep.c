#include "kernel/types.h"
#include "kernel/stat.h"
#include "kernel/fcntl.h"
#include "user/user.h"

int
main(int argc, char *argv[]) 
{
    int i;
    if (argc <= 1 || argc > 2) {
        fprintf(2, "usage: sleep [time]\n");
        exit(1);
    }
    i = atoi(argv[1]);
    // i = atoi(*++argv);
    fprintf(1, "%d", i);
    if(sleep(i) != 0){
      fprintf(2, "failed to sleep\n");
      exit(1);
    }
    exit(0);
}