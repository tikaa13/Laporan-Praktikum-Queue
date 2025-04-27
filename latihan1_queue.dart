class CircularQueue {
  final int maxQueue; // untuk kapasitas maksimum antrian
  late List<int> element; // list untuk menyimpan elemen antrian
  int front = -1; // indeks untuk elemen paling depan
  int rear = -1; // indeks untuk elemen terakhir

  // membuat konstruktor untuk menginisialisasi antrian kapasitas max
  CircularQueue(this.maxQueue) {
    element = List.filled(maxQueue, 0);
  }

  // mengecek untuk kondisi penuh
  bool isFull() {
    return (rear + 1) % maxQueue == front;
  }

  // mengecek untuk kondisi kosong
  bool isEmpty() {
    return front == -1;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat menambahkan data lagi");
      return;
    }
    if (isEmpty()) {
      front = 0;
    }
    rear = (rear + 1) % maxQueue;
    element[rear] = data;
    print("Enqueued: $data");
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue Underflow, tidak ada data untuk diambil");
      return -1;
    }
    int data = element[front];
    if (front == rear) {
      front = -1;
      rear = -1;
    } else {
      front = (front + 1) % maxQueue;
    }
    print("Dequeued: $data");
    return data;
  }

  void display() {
    if (isEmpty()) {
      print("Queue kosong");
      return;
    }
    print("Isi Queue: ");
    int i = front;
    while (true) {
      print(element[i]);
      if (i == rear) break;
      i = (i + 1) % maxQueue;
    }
  }
}

void main() {
  CircularQueue queue = CircularQueue(8);

  queue.enqueue(4);
  queue.enqueue(12);
  queue.enqueue(18);
  queue.display();

  queue.dequeue();
  queue.enqueue(25);
  queue.enqueue(20);
  queue.enqueue(13);
  queue.enqueue(31);
  queue.display();
}
