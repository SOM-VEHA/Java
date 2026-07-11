class Achievement {

  final String id;
  final String title;
  final String description;
  final String icon;
  final bool unlocked;
  final String? dateEarned;


  Achievement({

    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.unlocked,
    this.dateEarned,

  });


  factory Achievement.fromJson(Map<String,dynamic> json){

    return Achievement(

      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? 'Award',
      unlocked: json['unlocked'] ?? false,
      dateEarned: json['dateEarned'],

    );

  }


  Map<String,dynamic> toJson(){

    return {

      "id": id,
      "title": title,
      "description": description,
      "icon": icon,
      "unlocked": unlocked,
      "dateEarned": dateEarned,

    };

  }

}