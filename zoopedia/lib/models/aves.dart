class Aves {
  final String image;
  final String nama;
  final String nama_ilmiah;
  final String jenis;
  final String habitat;

  Aves({
    required this.image,
    required this.nama,
    required this.nama_ilmiah,
    required this.jenis,
    required this.habitat,
  });

  factory Aves.fromJson(Map<String, dynamic> json) {
    return Aves(
        image: json['image'] ?? '',
        nama: json['nama'] ?? '',
        nama_ilmiah: json['nama_ilmiah'] ?? '',
        jenis: json['jenis'] ?? '',
        habitat: json['habitat'] ?? '');
  }
}
