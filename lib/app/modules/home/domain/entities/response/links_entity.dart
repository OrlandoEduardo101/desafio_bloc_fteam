import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/about_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/author_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/cury_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/predecessor_version_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/version_history_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/wp_term_entity.dart';

class LinksEntity {
    LinksEntity({
        this.self = const [],       
        this.collection = const [],
        this.about = const [],
        this.author = const [],
        this.replies = const [],
        this.versionHistory = const [],
        this.predecessorVersion= const [],
        this.wpFeaturedmedia= const [],
        this.wpAttachment= const [],
        this.wpTerm= const [],
        this.curies= const [],
    });

    final List<AboutEntity> self;
    final List<AboutEntity> collection;
    final List<AboutEntity> about;
    final List<AuthorEntity> author;
    final List<AuthorEntity> replies;
    final List<VersionHistoryEntity> versionHistory;
    final List<PredecessorVersionEntity> predecessorVersion;
    final List<AuthorEntity> wpFeaturedmedia;
    final List<AboutEntity> wpAttachment;
    final List<WpTermEntity> wpTerm;
    final List<CuryEntity> curies;

    LinksEntity copyWith({
        List<AboutEntity>? self,
        List<AboutEntity>? collection,
        List<AboutEntity>? about,
        List<AuthorEntity>? author,
        List<AuthorEntity>? replies,
        List<VersionHistoryEntity>? versionHistory,
        List<PredecessorVersionEntity>? predecessorVersion,
        List<AuthorEntity>? wpFeaturedmedia,
        List<AboutEntity>? wpAttachment,
        List<WpTermEntity>? wpTerm,
        List<CuryEntity>? curies,
    }) => 
        LinksEntity(
            self: self ?? this.self,
            collection: collection ?? this.collection,
            about: about ?? this.about,
            author: author ?? this.author,
            replies: replies ?? this.replies,
            versionHistory: versionHistory ?? this.versionHistory,
            predecessorVersion: predecessorVersion ?? this.predecessorVersion,
            wpFeaturedmedia: wpFeaturedmedia ?? this.wpFeaturedmedia,
            wpAttachment: wpAttachment ?? this.wpAttachment,
            wpTerm: wpTerm ?? this.wpTerm,
            curies: curies ?? this.curies,
        );
}