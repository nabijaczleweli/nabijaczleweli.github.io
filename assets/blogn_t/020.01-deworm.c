#include <stdio.h>
#include <unistd.h>
int main() {
	short word;
	while(scanf("%ho", &word) == 1)
		write(1, &word, 2);
}
