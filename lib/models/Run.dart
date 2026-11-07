class Run {
  // ตัวแปลล้อกับข้อมูลในตาราง
  String? id;
  String? runWhere;
  String? runPerson;
  int? runDistance;
  String? runImageUrl;
  String? created_at;

// constructor

  Run({
    this.id,
    this.runWhere,
    this.runPerson,
    this.runDistance,
    this.runImageUrl,
    this.created_at,
  }
  
  );
  Map<String, dynamic> toJson() => {
    'runWhere': runWhere,
    'runPerson': runPerson,
    'runDistance': runDistance,
    'runImageUrl': runImageUrl,
  };

  // แปลงข้อมูลจาก json ให้เป็น object
  factory Run.fromJson(Map<String, dynamic> json) => Run(
      id: json['id'] as String,
      runWhere: json['runWhere'] as String,
      runPerson: json['runPerson'] as String,
      runDistance: json['runDistance'] as int,
      runImageUrl: json['runImageUrl'] as String,
      created_at: json['created_at'] as String,
  );
}