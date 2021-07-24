class AuthorEntity {
    AuthorEntity({
        this.embeddable = false,
        this.href = '',
    });

    final bool embeddable;
    final String href;

    AuthorEntity copyWith({
        bool? embeddable,
        String? href,
    }) => 
        AuthorEntity(
            embeddable: embeddable ?? this.embeddable,
            href: href ?? this.href,
        );

}