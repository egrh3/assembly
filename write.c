#include <stdio.h>
#include <unistd.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#ifndef ZIPIT
#define ZIPIT "fd"
#endif

int main(void) {
	char* filename = "output.txt";
	int fd = 0;

	int flags = O_CREAT | O_APPEND | O_RDWR;
//	fd = open(filename, O_CREAT | O_APPEND, 0700);
	fd = open(filename, flags, 0600);

	printf("flags: %x\n", flags);
	printf("%s: %d\n", ZIPIT, fd);

	close(fd);

	return 0;
}
