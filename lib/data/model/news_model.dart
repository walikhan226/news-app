// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) => List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
    News({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.categories,
        this.tags,
        this.jetpackFeaturedMediaUrl,
        this.jetpackPublicizeConnections,
        this.jetpackShortlink,
        this.jetpackSharingEnabled,
        this.jetpackLikesEnabled,
        this.links,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    StatusEnum status;
    Type type;
    String link;
    Guid title;
    Content content;
    Content excerpt;
    int author;
    int featuredMedia;
    Status commentStatus;
    Status pingStatus;
    bool sticky;
    String template;
    Format format;
    Meta meta;
    List<int> categories;
    List<int> tags;
    String jetpackFeaturedMediaUrl;
    List<dynamic> jetpackPublicizeConnections;
    String jetpackShortlink;
    bool jetpackSharingEnabled;
    bool jetpackLikesEnabled;
    Links links;

    factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusEnumValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: statusValues.map[json["comment_status"]],
        pingStatus: statusValues.map[json["ping_status"]],
        sticky: json["sticky"],
        template: json["template"],
        format: formatValues.map[json["format"]],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<int>.from(json["tags"].map((x) => x)),
        jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
        jetpackPublicizeConnections: List<dynamic>.from(json["jetpack_publicize_connections"].map((x) => x)),
        jetpackShortlink: json["jetpack_shortlink"],
        jetpackSharingEnabled: json["jetpack_sharing_enabled"],
        jetpackLikesEnabled: json["jetpack_likes_enabled"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": statusEnumValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": statusValues.reverse[commentStatus],
        "ping_status": statusValues.reverse[pingStatus],
        "sticky": sticky,
        "template": template,
        "format": formatValues.reverse[format],
        "meta": meta.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
        "jetpack_publicize_connections": List<dynamic>.from(jetpackPublicizeConnections.map((x) => x)),
        "jetpack_shortlink": jetpackShortlink,
        "jetpack_sharing_enabled": jetpackSharingEnabled,
        "jetpack_likes_enabled": jetpackLikesEnabled,
        "_links": links.toJson(),
    };
}

enum Status { OPEN }

final statusValues = EnumValues({
    "open": Status.OPEN
});

class Content {
    Content({
        this.rendered,
        this.protected,
    });

    String rendered;
    bool protected;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

enum Format { STANDARD }

final formatValues = EnumValues({
    "standard": Format.STANDARD
});

class Guid {
    Guid({
        this.rendered,
    });

    String rendered;

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.wpTerm,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<VersionHistory> versionHistory;
    List<Author> wpFeaturedmedia;
    List<About> wpAttachment;
    List<WpTerm> wpTerm;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
    };
}

class About {
    About({
        this.href,
    });

    String href;

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    Author({
        this.embeddable,
        this.href,
    });

    bool embeddable;
    String href;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class Cury {
    Cury({
        this.name,
        this.href,
        this.templated,
    });

    Name name;
    Href href;
    bool templated;

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
    };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
    "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
    "wp": Name.WP
});

class VersionHistory {
    VersionHistory({
        this.count,
        this.href,
    });

    int count;
    String href;

    factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
    };
}

class WpTerm {
    WpTerm({
        this.taxonomy,
        this.embeddable,
        this.href,
    });

    Taxonomy taxonomy;
    bool embeddable;
    String href;

    factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable,
        "href": href,
    };
}

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues = EnumValues({
    "category": Taxonomy.CATEGORY,
    "post_tag": Taxonomy.POST_TAG
});

class Meta {
    Meta({
        this.advancedSeoDescription,
        this.coblocksAttr,
        this.coblocksDimensions,
        this.coblocksResponsiveHeight,
        this.coblocksAccordionIeSupport,
        this.publishToDiscourse,
        this.publishPostCategory,
        this.wpdcAutoPublishOverridden,
        this.wpdcTopicTags,
        this.wpdcPinTopic,
        this.wpdcPinUntil,
        this.discoursePostId,
        this.discoursePermalink,
        this.wpdcPublishingResponse,
        this.wpdcPublishingError,
        this.spayEmail,
        this.jetpackPublicizeMessage,
    });

    String advancedSeoDescription;
    String coblocksAttr;
    String coblocksDimensions;
    String coblocksResponsiveHeight;
    String coblocksAccordionIeSupport;
    String publishToDiscourse;
    String publishPostCategory;
    String wpdcAutoPublishOverridden;
    String wpdcTopicTags;
    String wpdcPinTopic;
    String wpdcPinUntil;
    String discoursePostId;
    String discoursePermalink;
    WpdcPublishingResponse wpdcPublishingResponse;
    String wpdcPublishingError;
    String spayEmail;
    String jetpackPublicizeMessage;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        advancedSeoDescription: json["advanced_seo_description"],
        coblocksAttr: json["_coblocks_attr"],
        coblocksDimensions: json["_coblocks_dimensions"],
        coblocksResponsiveHeight: json["_coblocks_responsive_height"],
        coblocksAccordionIeSupport: json["_coblocks_accordion_ie_support"],
        publishToDiscourse: json["publish_to_discourse"],
        publishPostCategory: json["publish_post_category"],
        wpdcAutoPublishOverridden: json["wpdc_auto_publish_overridden"],
        wpdcTopicTags: json["wpdc_topic_tags"],
        wpdcPinTopic: json["wpdc_pin_topic"],
        wpdcPinUntil: json["wpdc_pin_until"],
        discoursePostId: json["discourse_post_id"],
        discoursePermalink: json["discourse_permalink"],
        wpdcPublishingResponse: wpdcPublishingResponseValues.map[json["wpdc_publishing_response"]],
        wpdcPublishingError: json["wpdc_publishing_error"],
        spayEmail: json["spay_email"],
        jetpackPublicizeMessage: json["jetpack_publicize_message"],
    );

    Map<String, dynamic> toJson() => {
        "advanced_seo_description": advancedSeoDescription,
        "_coblocks_attr": coblocksAttr,
        "_coblocks_dimensions": coblocksDimensions,
        "_coblocks_responsive_height": coblocksResponsiveHeight,
        "_coblocks_accordion_ie_support": coblocksAccordionIeSupport,
        "publish_to_discourse": publishToDiscourse,
        "publish_post_category": publishPostCategory,
        "wpdc_auto_publish_overridden": wpdcAutoPublishOverridden,
        "wpdc_topic_tags": wpdcTopicTags,
        "wpdc_pin_topic": wpdcPinTopic,
        "wpdc_pin_until": wpdcPinUntil,
        "discourse_post_id": discoursePostId,
        "discourse_permalink": discoursePermalink,
        "wpdc_publishing_response": wpdcPublishingResponseValues.reverse[wpdcPublishingResponse],
        "wpdc_publishing_error": wpdcPublishingError,
        "spay_email": spayEmail,
        "jetpack_publicize_message": jetpackPublicizeMessage,
    };
}

enum WpdcPublishingResponse { SUCCESS }

final wpdcPublishingResponseValues = EnumValues({
    "success": WpdcPublishingResponse.SUCCESS
});

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({
    "publish": StatusEnum.PUBLISH
});

enum Type { POST }

final typeValues = EnumValues({
    "post": Type.POST
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
