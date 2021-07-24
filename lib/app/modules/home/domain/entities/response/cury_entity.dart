class CuryEntity {
    CuryEntity({
        this.name = '',
        this.href = '',
        this.templated = false,
    });

    final String name;
    final String href;
    final bool templated;

    CuryEntity copyWith({
        String? name,
        String? href,
        bool? templated,
    }) => 
        CuryEntity(
            name: name ?? this.name,
            href: href ?? this.href,
            templated: templated ?? this.templated,
        );

    factory CuryEntity.fromJson(Map<String, dynamic> json) => CuryEntity(
        
    );

    Map<String, dynamic> toJson() => {
        
    };
}