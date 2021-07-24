class ContentEntity {
    ContentEntity({
        this.rendered = '',
        this.protected = false,
    });

    final String rendered;
    final bool protected;

    ContentEntity copyWith({
        String? rendered,
        bool? protected,
    }) => 
        ContentEntity(
            rendered: rendered ?? this.rendered,
            protected: protected ?? this.protected,
        );
}