#include <stdio.h>
#include <string.h>
#include <cassert>
#include <string>
char buf[64 * 1024];
int main(int argc, char **argv) {
  FILE *script = fopen(argv[1], "re");
  fgets(buf, sizeof(buf), script);

  double time_as_issued = -1, time_as_done = -2;

  FILE *timing = fopen(argv[2], "re");
  std::string sofar;
  double time_sofar = 0;
  while(fgets(buf, sizeof(buf), timing)) {
    time_sofar += atof(strtok(buf, " \t\n"));

    long long bytes = atoll(strtok(nullptr, " \t\n"));
    assert(bytes <= sizeof(buf));
    assert(fread(buf, 1, bytes, script) == bytes);

    sofar.append(buf, bytes);
    if(time_as_issued == -1 && sofar.ends_with("as u*.s"))
    	time_as_issued = time_sofar;
    else if(time_as_issued != -1 && sofar.ends_with("# ")) {
    	time_as_done = time_sofar;
    	break;
    }
  }

  printf("%fs: %s\n", time_as_done - time_as_issued, argv[1]);
}
