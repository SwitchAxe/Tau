#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <stdio.h>
#include <ifaddrs.h>
#include <linux/if_link.h>
#include <stdlib.h>
#include <netdb.h>
#include <sys/un.h>
#define NI_MAXHOST 1025
#define NI_NUMERICHOST 1

int ffi_socket(int family, int type) {
	int sckt;
	sckt = socket(family, type, 0);
	if (sckt < 0) {
		fprintf(stderr, "Failed to create a socket!\n");
		return -1;
	}
	struct sockaddr_un dest_sad;
	dest_sad.sun_family = AF_UNIX;
	//where the X server looks for connections
	strcpy(dest_sad.sun_path, "/tmp/.X11-unix/X0");
	if (connect(sckt, (struct sockaddr*) &dest_sad, sizeof(dest_sad)) < 0) {
		fprintf(stderr, "connection to the X server failed! %s\n", strerror(errno));
		close(sckt);
		return -1;
	}
	return sckt;
}


int ffi_close(int sckt) {
	if (close(sckt) < 0) {
		fprintf(stderr, "close() on socket %d failed!\n", sckt);
		return -1;
	}
	return 0;
}

int ffi_write(int sckt, char* s, int size) {
	int i;
	int m = size;
	while (m > 0) {
		if ((i = write(sckt, s, m)) < 0) {
			if (errno != EAGAIN && errno != EINTR) {
				return i;
			}
		} else {
			m -= i;
			s += i;
		}
	}
	return size;
}

int ffi_read(int sckt, char* buf, int size) {
	int i;
	for (;;) {
		i = read(sckt, buf, size);
		if (i >= 0) return i;
		if (errno != EAGAIN && errno != EINTR) return -1;
	}
	return i;
}

int ffi_free(char* ptr) {
	if (ptr == NULL) return -1;
	free(ptr);
	return 0;
}


