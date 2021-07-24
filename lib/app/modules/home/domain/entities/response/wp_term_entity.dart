class WpTermEntity {
    WpTermEntity({
        this.taxonomy = '',
        this.embeddable = false,
        this.href = '',
    });

    final String taxonomy;
    final bool embeddable;
    final String href;

    WpTermEntity copyWith({
        String? taxonomy,
        bool? embeddable,
        String? href,
    }) => 
        WpTermEntity(
            taxonomy: taxonomy ?? this.taxonomy,
            embeddable: embeddable ?? this.embeddable,
            href: href ?? this.href,
        );

}
