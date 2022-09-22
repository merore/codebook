#include<stdlib.h>
#include<pthread.h>

int i=0;

void* threadA() {
	for(;!i;) {}
}

void* threadB() {
	i=1;
}


int main() {
	pthread_t a;
	pthread_t b;

	pthread_create(&a, NULL, threadA, NULL);
	pthread_create(&b, NULL, threadB, NULL);


	void* ret;
	pthread_join(a, &ret);
	pthread_join(b, &ret);
}
