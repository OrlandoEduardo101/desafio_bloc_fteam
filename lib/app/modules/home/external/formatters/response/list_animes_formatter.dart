import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/entities/response/list_animes_entity.dart';
import '../../../domain/errors/errors/errors.dart';
import 'content_formatter.dart';
import 'guid_formatter.dart';
import 'links_formatter.dart';

class ListAnimesFormatter extends IMapper<ListAnimesEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = [
      'id',
      'date',
      'date_gmt',
      'guid',
      'modified',
      'modified_gmt',
      'slug',
      'status',
      'type',
      'link',
      'title',
      'content',
      'excerpt',
      'author',
      'featured_media',
      'comment_status',
      'ping_status',
      'sticky',
      'format',
      'meta',
      'categories',
      'tags',
      'yoast_head',
      '_links',
      'template'
    ];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<ListAnimesEntity> fromMap(Map json) async {
    await checkJson(json);
    try{

      return ListAnimesEntity(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
        guid: json["guid"] == null ? null : (await GuidFormatter().fromMap(json["guid"])),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"] == null ? null : json["status"],
        type: json["type"] == null ? null : json["type"],
        link: json["link"] == null ? null : json["link"],
        title: json["title"] == null ? null : (await GuidFormatter().fromMap(json["title"])),
        content: json["content"] == null ? null : (await ContentFormatter().fromMap(json["content"])),
        excerpt: json["excerpt"] == null ? null : (await ContentFormatter().fromMap(json["excerpt"])),
        author: json["author"] == null ? null : json["author"],
        featuredMedia: json["featured_media"] == null ? null : json["featured_media"],
        commentStatus: json["comment_status"] == null ? null : json["comment_status"],
        pingStatus: json["ping_status"] == null ? null : json["ping_status"],
        sticky: json["sticky"] == null ? null : json["sticky"],
        template: json["template"] == null ? null : json["template"],
        format: json["format"] == null ? null : json["format"],
        meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"].map((x) => x)),
        categories: json["categories"] == null ? [] : List<int>.from(json["categories"].map((x) => x)),
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"].map((x) => x)),
        yoastHead: json["yoast_head"] == null ? null : json["yoast_head"],
        links: json["_links"] == null ? null : (await LinksFormatter().fromMap(json["_links"])),
      );

    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "id": object.id,
        "date": object.date == null ? null : object.date?.toIso8601String(),
        "date_gmt": object.dateGmt == null ? null : object.dateGmt?.toIso8601String(),
        "guid": object.guid == null ? null : GuidFormatter().toMap(object.guid!),
        "modified": object.modified == null ? null : object.modified?.toIso8601String(),
        "modified_gmt": object.modifiedGmt == null ? null : object.modifiedGmt?.toIso8601String(),
        "slug": object.slug,
        "status": object.status,
        "type": object.type,
        "link": object.link,
        "title": object.title,
        "content": object.content == null ? null : ContentFormatter().toMap(object.content!),
        "excerpt": object.excerpt == null ? null : ContentFormatter().toMap(object.excerpt!),
        "author": object.author == 0 ? null : object.author,
        "featured_media": object.featuredMedia,
        "comment_status": object.commentStatus,
        "ping_status": object.pingStatus,
        "sticky": object.sticky,
        "template": object.template,
        "format": object.format,
        "meta":List<dynamic>.from(object.meta.map((x) => x)),
        "categories": List<dynamic>.from(object.categories.map((x) => x)),
        "tags": List<dynamic>.from(object.tags.map((x) => x)),
        "yoast_head": object.yoastHead,
        "_links": object.links == null ? null : LinksFormatter().toMap(object.links!),
      };
}
