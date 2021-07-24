class GuidEntity {
    GuidEntity({
        this.rendered = '',
    });

    final String rendered;

    GuidEntity copyWith({
        String? rendered,
    }) => 
        GuidEntity(
            rendered: rendered ?? this.rendered,
        );
}