class PredecessorVersionEntity {
    PredecessorVersionEntity({
        this.id = -1,
        this.href = '',
    });

    final int id;
    final String href;

    PredecessorVersionEntity copyWith({
        int? id,
        String? href,
    }) => 
        PredecessorVersionEntity(
            id: id ?? this.id,
            href: href ?? this.href,
        );

    factory PredecessorVersionEntity.fromJson(Map<String, dynamic> json) => PredecessorVersionEntity(
        id: json["id"] == null ? null : json["id"],
        href: json["href"] == null ? null : json["href"],
    );

    Map<String, dynamic> toJson() => {
        
    };
}