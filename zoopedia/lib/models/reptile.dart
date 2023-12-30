class Reptile {
  final String image;
  final String nama;
  final String nama_ilmiah;
  final String jenis;
  final String habitat;

  Reptile({
    required this.image,
    required this.nama,
    required this.nama_ilmiah,
    required this.jenis,
    required this.habitat,
  });

  factory Reptile.fromJson(Map<String, dynamic> json) {
    return Reptile(
        image: json['image'] ?? '',
        nama: json['nama'] ?? '',
        nama_ilmiah: json['nama_ilmiah'] ?? '',
        jenis: json['jenis'] ?? '',
        habitat: json['habitat'] ?? '');
  }
}
