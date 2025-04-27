import 'dart:io';

// membuat class untuk merepresentasikan nasabah
class Nasabah {
  String nama;
  int noRekening;

  // menambahkan konstruktor untuk menginisialisasi nasabah
  Nasabah(this.nama, this.noRekening);
}

// menambahkan method Circular Queue
class CircularQueue {
  final int maxQueue; // untuk kapasitas max antrian
  late List<Nasabah> element; // list untuk menyimpan elemen dari nasabah
  int front = -1; // indeks untuk elemen paling depan
  int rear = -1; // indeks untuk elemen terakhir

  // menambahkan konstruktor untuk menginisialisasi antrian
  CircularQueue(this.maxQueue) {
    element = List.filled(maxQueue, Nasabah('', 0)); // mengisi List dengan nasabah kosong
  }

  // cek kondisi antrian penuh
  bool isFull() {
    return (rear + 1) % maxQueue == front;
  }

  // cek kondisi antrian kosong
  bool isEmpty() {
    return front == -1;
  }

  // menambahkan nasabah dalam antrian
  void enqueue(Nasabah nasabah) {
    if (isFull()) {
      print("Antrian penuh, tidak dapat menambahkan nasabah.");
      return;
    }
    if (isEmpty()) {
      front = 0;
    }
    rear = (rear + 1) % maxQueue;
    element[rear] = nasabah;
    print("Nasabah '${nasabah.nama}' telah ditambahkan ke antrian.");
  }

  // mengambil nasabah dari antrian
  Nasabah dequeue() {
    if (isEmpty()) {
      print("Antrian kosong, tidak ada nasabah untuk dilayani.");
      return Nasabah('', 0);
    }
    Nasabah nasabah = element[front];
    if (front == rear) {
      front = -1;
      rear = -1;
    } else {
      front = (front + 1) % maxQueue;
    }
    print("Nasabah '${nasabah.nama}' telah dilayani."); // menampilkan nasabah yang dilayani
    return nasabah; // mengembalikan nasabah yang sudah dilayani
  }

  void display() {
    if (isEmpty()) {
      print("Antrian kosong.");
      return;
    }
    print("Isi Antrian Nasabah: ");
    int i = front;
    while (true) {
      print("Nama: ${element[i].nama}, No Rekening: ${element[i].noRekening}");
      if (i == rear) break;
      i = (i + 1) % maxQueue;
    }
  }
}

void main() {
  CircularQueue queue = CircularQueue(3); // membuat kapasitas max
  int choice; // variabel menyimpan pilihan menu

  do {
    print("\nMenu Antrian Nasabah:");
    print("1. Tambah Nasabah");
    print("2. Layani Nasabah");
    print("3. Tampilkan Antrian");
    print("4. Keluar");
    stdout.write("Pilih opsi (1-4): ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1: // pilihan untuk menambah nasabah
        stdout.write("Masukkan nama nasabah: ");
        String nama = stdin.readLineSync()!;
        stdout.write("Masukkan nomor rekening: ");
        int noRekening = int.parse(stdin.readLineSync()!);
        Nasabah nasabah = Nasabah(nama, noRekening);
        queue.enqueue(nasabah);
        break;
      case 2: // pilihan untuk melayani nasabah
        Nasabah dilayani = queue.dequeue();
        if (dilayani.nama.isNotEmpty) {
          print("Nasabah '${dilayani.nama}' dilayani.");
        }
        break;
      case 3: // pilihan untuk menampilkan antrian
        queue.display();
        break;
      case 4: // pilihan untuk keluar dari program
        print("Keluar dari program.");
        break;
      default: // pilihan tidak valid
        print("Pilihan tidak valid. Silakan coba lagi.");
    }
  } while (choice != 4);
}
