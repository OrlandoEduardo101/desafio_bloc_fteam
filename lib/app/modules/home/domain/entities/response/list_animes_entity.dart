

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/content_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/guid_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/links_entity.dart';

class ListAnimesEntity {
    ListAnimesEntity({
        this.id = -1,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug = '',
        this.status = '',
        this.type = '',
        this.link = '',
        this.title,
        this.content,
        this.excerpt,
        this.author = -1,
        this.featuredMedia = -1,
        this.commentStatus = '',
        this.pingStatus = '',
        this.sticky = false,
        this.template = '',
        this.format = '',
        this.meta = const [],
        this.categories = const [],
        this.tags = const [],
        this.yoastHead = '',
        this.links,
    });

    final int id;
    final DateTime? date;
    final DateTime? dateGmt;
    final GuidEntity? guid;
    final DateTime? modified;
    final DateTime? modifiedGmt;
    final String slug;
    final String status;
    final String type;
    final String link;
    final GuidEntity? title;
    final ContentEntity? content;
    final ContentEntity? excerpt;
    final int author;
    final int featuredMedia;
    final String commentStatus;
    final String pingStatus;
    final bool sticky;
    final String template;
    final String format;
    final List<dynamic> meta;
    final List<int> categories;
    final List<int> tags;
    final String yoastHead;
    final LinksEntity? links;

    ListAnimesEntity copyWith({
        int? id,
        DateTime? date,
        DateTime? dateGmt,
        GuidEntity? guid,
        DateTime? modified,
        DateTime? modifiedGmt,
        String? slug,
        String? status,
        String? type,
        String? link,
        GuidEntity? title,
        ContentEntity? content,
        ContentEntity? excerpt,
        int? author,
        int? featuredMedia,
        String? commentStatus,
        String? pingStatus,
        bool? sticky,
        String? template,
        String? format,
        List<dynamic>? meta,
        List<int>? categories,
        List<int>? tags,
        String? yoastHead,
        LinksEntity? links,
    }) => 
        ListAnimesEntity(
            id: id ?? this.id,
            date: date ?? this.date,
            dateGmt: dateGmt ?? this.dateGmt,
            guid: guid ?? this.guid,
            modified: modified ?? this.modified,
            modifiedGmt: modifiedGmt ?? this.modifiedGmt,
            slug: slug ?? this.slug,
            status: status ?? this.status,
            type: type ?? this.type,
            link: link ?? this.link,
            title: title ?? this.title,
            content: content ?? this.content,
            excerpt: excerpt ?? this.excerpt,
            author: author ?? this.author,
            featuredMedia: featuredMedia ?? this.featuredMedia,
            commentStatus: commentStatus ?? this.commentStatus,
            pingStatus: pingStatus ?? this.pingStatus,
            sticky: sticky ?? this.sticky,
            template: template ?? this.template,
            format: format ?? this.format,
            meta: meta ?? this.meta,
            categories: categories ?? this.categories,
            tags: tags ?? this.tags,
            yoastHead: yoastHead ?? this.yoastHead,
            links: links ?? this.links,
        );
}