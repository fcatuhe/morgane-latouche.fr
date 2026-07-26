module StructuredDataHelper
  def local_business_json_ld
    json_ld_tag(local_business_schema)
  end

  private
    def json_ld_tag(data)
      tag.script(
        json_escape(JSON.pretty_generate(data)).html_safe,
        type: "application/ld+json"
      )
    end

    def local_business_schema
      {
        "@context": "https://schema.org",
        "@type": "HealthAndBeautyBusiness",
        "@id": business_id,
        name: Business::NAME,
        description: Meta::DEFAULT_DESCRIPTION,
        url: root_url,
        image: image_url(Meta::DEFAULT_IMAGE),
        logo: image_url(Business::LOGO),
        telephone: Business::PHONE,
        email: Business::EMAIL,
        address: {
          "@type": "PostalAddress",
          streetAddress: Business::STREET_ADDRESS,
          postalCode: Business::POSTAL_CODE,
          addressLocality: Business::CITY,
          addressRegion: Business::REGION,
          addressCountry: Business::COUNTRY
        },
        geo: {
          "@type": "GeoCoordinates",
          latitude: Business::LATITUDE,
          longitude: Business::LONGITUDE
        },
        founder: {
          "@type": "Person",
          name: Business::PRACTITIONER,
          jobTitle: Business::JOB_TITLE,
          sameAs: Business::INSTAGRAM_URL
        },
        sameAs: [ Business::INSTAGRAM_URL ],
        availableLanguage: "fr",
        currenciesAccepted: Business::CURRENCY,
        priceRange: Business::PRICE_RANGE,
        areaServed: Business::AREA_SERVED.map { |city| { "@type": "City", name: city } },
        makesOffer: {
          "@type": "Offer",
          price: Business::SESSION_PRICE,
          priceCurrency: Business::CURRENCY,
          availability: "https://schema.org/InStock",
          url: Business::BOOKING_URL,
          itemOffered: {
            "@type": "Service",
            name: Business::SESSION_NAME,
            description: Business::SESSION_DESCRIPTION,
            serviceType: "Réflexologie plantaire",
            provider: { "@id": business_id }
          }
        },
        potentialAction: {
          "@type": "ReserveAction",
          name: "Réservez votre séance",
          target: {
            "@type": "EntryPoint",
            urlTemplate: Business::BOOKING_URL,
            actionPlatform: [
              "https://schema.org/DesktopWebPlatform",
              "https://schema.org/MobileWebPlatform"
            ]
          }
        }
      }
    end

    def business_id
      "#{root_url}#cabinet"
    end
end
