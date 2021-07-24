class AboutEntity {
    AboutEntity({
        this.href = '',
    });

    final String href;

    AboutEntity copyWith({
        String? href,
    }) => 
        AboutEntity(
            href: href ?? this.href,
        );

}