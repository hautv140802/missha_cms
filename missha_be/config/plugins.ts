export default ({env}) => ({
  slugify: {
    enabled: true,
    config: {
      contentTypes: {
        category: {
          field: 'slug',
          references: 'name',
          options: {
            locale: 'vi',
          },
        },
        product: {
          field: 'slug',
          references: 'name',
          options: {
            locale: 'vi',
          },
        },
        // blog: {
        //   field: 'slug',
        //   references: 'name',
        //   options: {
        //     locale: 'vi',
        //   }
        // },
        // blog_category: {
        //   field: 'slug',
        //   references: 'name',
        //   options: {
        //     locale: 'vi',
        //   },
        // },
        "product-line": {
          field: 'slug',
          references: 'name',
          options: {
            locale: 'vi',
          },
        },
        "skin-property": {
          field: 'slug',
          references: 'name',
          options: {
            locale: 'vi',
          },
        },
        "service": {
          field: 'slug',
          references: 'title',
          options: {
            locale: 'vi',
          },
        }
      },
    },
  },
  meilisearch: {
    enabled: true,
    config: {
      // Your meili host
      host: env('MEILISEARCH_HOST','http://localhost:7707'),
      // Your master key or private key
      apiKey: env('MEILISEARCH_API_KEY','masterKey'),

      product: {
        settings: {
          searchableAttributes: ['name', 'description', 'categories']
        }
      }
    }
  },
});
