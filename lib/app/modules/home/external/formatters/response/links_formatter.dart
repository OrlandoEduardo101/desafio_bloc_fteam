import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/about_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/author_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/cury_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/links_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/predecessor_version_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/version_history_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/wp_term_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/external/formatters/response/version_history_formatter.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';
import 'about_formatter.dart';
import 'author_formatter.dart';
import 'cury_formatter.dart';
import 'predecessor_version_formatter.dart';
import 'wp_term_formatter.dart';

class LinksFormatter extends IMapper<LinksEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = [
      'self',
      'collection',
      'about',
      'author',
      'replies',
      'version-history',
      'predecessor-version',
      'wp:featuredmedia',
      'wp:attachment',
      'wp:term',
      'curies'
    ];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<LinksEntity> fromMap(Map json) async {
    await checkJson(json);

    try {
    final List<AboutEntity> selfList = [];

    for (var item in json["self"] ?? []) {
      selfList.add(await AboutFormatter().fromMap(item));
    }

    final List<AboutEntity> collectionList = [];

    for (var item in json["collection"] ?? []) {
      collectionList.add(await AboutFormatter().fromMap(item));
    }

    final List<AboutEntity> aboutList = [];

    for (var item in json["about"] ?? []) {
      aboutList.add(await AboutFormatter().fromMap(item));
    }

    final List<AuthorEntity> authorList = [];

    for (var item in json["author"] ?? []) {
      authorList.add(await AuthorFormatter().fromMap(item));
    }

    final List<AuthorEntity> repliesList = [];

    for (var item in json["replies"] ?? []) {
      repliesList.add(await AuthorFormatter().fromMap(item));
    }

    final List<VersionHistoryEntity> versionHistoryList = [];

    for (var item in json["version-history"] ?? []) {
      versionHistoryList
          .add(await VersionHistoryEntityFormatter().fromMap(item));
    }

    final List<PredecessorVersionEntity> predecessorVersionList = [];

    for (var item in json["predecessor-version"] ?? []) {
      predecessorVersionList
          .add(await PredecessorVersionFormatter().fromMap(item));
    }

    final List<AuthorEntity> wpFeaturedmediaList = [];

    for (var item in json["wp:featuredmedia"] ?? []) {
      wpFeaturedmediaList.add(await AuthorFormatter().fromMap(item));
    }

    final List<AboutEntity> wpAttachmentList = [];

    for (var item in json["wp:attachment"] ?? []) {
      wpAttachmentList.add(await AboutFormatter().fromMap(item));
    }

    final List<WpTermEntity> wpTermList = [];

    for (var item in json["wp:term"] ?? []) {
      wpTermList.add(await WpTermFormatter().fromMap(item));
    }

    final List<CuryEntity> curyList = [];

    for (var item in json["curies"] ?? []) {
      curyList.add(await CuryFormatter().fromMap(item));
    }

      return LinksEntity(
        self: selfList,
        collection: collectionList,
        about: aboutList,
        author: authorList,
        replies: repliesList,
        versionHistory: versionHistoryList,
        predecessorVersion: predecessorVersionList,
        wpFeaturedmedia: wpFeaturedmediaList,
        wpAttachment: wpAttachmentList,
        wpTerm: wpTermList,
        curies: curyList,
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) {

    final List selfList = [];

    for (var item in object.self) {
      selfList.add(AboutFormatter().toMap(item));
    }

    final List collectionList = [];

    for (var item in object.collection) {
      collectionList.add(AboutFormatter().toMap(item));
    }

    final List aboutList = [];

    for (var item in object.about) {
      aboutList.add(AboutFormatter().toMap(item));
    }

    final List authorList = [];

    for (var item in object.author) {
      authorList.add(AuthorFormatter().toMap(item));
    }

    final List repliesList = [];

    for (var item in object.replies) {
      repliesList.add(AuthorFormatter().toMap(item));
    }

    final List versionHistoryList = [];

    for (var item in object.versionHistory) {
      versionHistoryList
          .add(VersionHistoryEntityFormatter().toMap(item));
    }

    final List predecessorVersionList = [];

    for (var item in object.predecessorVersion) {
      predecessorVersionList
          .add(PredecessorVersionFormatter().toMap(item));
    }

    final List wpFeaturedmediaList = [];

    for (var item in object.replies) {
      wpFeaturedmediaList.add(AuthorFormatter().toMap(item));
    }

    final List wpAttachmentList = [];

    for (var item in object.wpAttachment) {
      wpAttachmentList.add(AboutFormatter().toMap(item));
    }

    final List wpTermList = [];

    for (var item in object.wpTerm) {
      wpTermList.add(WpTermFormatter().toMap(item));
    }

    final List curyList = [];

    for (var item in object.curies) {
      curyList.add(CuryFormatter().toMap(item));
    }
    
    return {
        "self": selfList,
        "collection": collectionList,
        "about": aboutList,
        "author": authorList,
        "replies": repliesList,
        "version-history": versionHistoryList,
        "predecessor-version": predecessorVersionList,
        "wp:featuredmedia": wpFeaturedmediaList,
        "wp:attachment": wpAttachmentList,
        "wp:term": wpTermList,
        "curies": curyList,
      };
  }
}
