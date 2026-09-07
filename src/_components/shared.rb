module Shared
  class Navbar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      @strategy = Willamette.navbar(
        self,
        logo: "/images/merck_logo.png",
        logo_alt: "Merck Logo",
        search: true,
        site_title: metadata.title,
        nav_links: [
          Willamette.link(title: t("nav.blog"), url: "/blog"),
          Willamette.link(title: t("nav.about"), url: "/about"),
          Willamette.link(icon: "mastodon", icon_family: "brands", icon_label: "Mastodon", title: nil, url: "https://mastodon.social"),
        ]
      )
    end
  end

  class Sidebar < Bridgetown::Component
    attr_reader :metadata, :resource, :strategy

    # @param metadata [HashWithDotAccess::Hash]
    # @param resource [Bridgetown::Resource::Base]
    def initialize(metadata:, resource:)
      @metadata, @resource = metadata, resource

      explore_links = if resource.is_a?(Bridgetown::Resource::Base) && resource.collection.label == "docs"
                        Willamette.links_for(resource)
                      end

      @strategy = Willamette.sidebar(
        self,
        description: metadata.description,
        explore_links:,
        follow_links: [
          Willamette.link(icon: "message", title: "Contact us", url: "mailto:mrlit@merck.com"),
          # Willamette.link(icon: "bluesky", icon_family: "brands", title: "@myblue", url: "https://bsky.social"),
        ],
        subscribe: false,
        see_also_links: [
          Willamette.link(icon: "laptop", title: "mrlit.merck.com", url: "https://mrlit.merck.com"),
          Willamette.link(icon: "person", title: "MRL IT MS Teams", url: "https://www.dailyzen.com"),
        ]
      )
    end
  end
end
