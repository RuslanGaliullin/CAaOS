#include <cstdio>
#include <mpi.h>
#include <unistd.h>

const int len = 50;

int main(int argc, char **argv) {
  int i, rank, size;
  char buffer[len];
  MPI_Status status;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  if (size != 3) {
    printf("Process %d, Incorrect processes number = %d. Only two processes "
           "are possible!\n",
           rank, size);
    MPI_Finalize();
    return 0;
  }
  sprintf(buffer, "Hello from %d", rank); // формирование сообщения
  auto t1 = MPI_Wtime(); // фиксация времени «начала посылки»,
  MPI_Send(buffer, len, MPI_CHAR, (rank + 1) % 3, (rank + 1) % 3,
           MPI_COMM_WORLD);
  MPI_Recv(buffer, len, MPI_CHAR, (size + rank - 1) % 3, rank, MPI_COMM_WORLD,
           &status);
  auto t2 = MPI_Wtime();

  printf("Process % d--->Buffer = %s\n ", rank, buffer);
  //  вывод
  //  сообщения
  printf("From process %d.Time = %le\n ", rank, (t2 - t1)); // a
  MPI_Finalize();
  return 0;
}

