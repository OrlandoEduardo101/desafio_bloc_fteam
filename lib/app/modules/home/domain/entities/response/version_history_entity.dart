class VersionHistoryEntity {
    VersionHistoryEntity({
        this.count = 0,
        this.href = '',
    });

    final int count;
    final String href;

    VersionHistoryEntity copyWith({
        int? count,
        String? href,
    }) => 
        VersionHistoryEntity(
            count: count ?? this.count,
            href: href ?? this.href,
        );

}