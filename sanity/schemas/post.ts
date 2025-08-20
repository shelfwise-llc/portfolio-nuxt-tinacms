import {defineField, defineType} from 'sanity'

export default defineType({
  name: 'post',
  title: 'Post',
  type: 'document',
  fields: [
    defineField({ name: 'title', type: 'string', title: 'Title' }),
    defineField({ name: 'slug', type: 'slug', title: 'Slug', options: { source: 'title', maxLength: 96 } }),
    defineField({ name: 'excerpt', type: 'text', title: 'Excerpt' }),
    defineField({
      name: 'body',
      title: 'Body',
      type: 'array',
      of: [
        { type: 'block' },
      ],
    }),
    defineField({ name: 'source', type: 'string', title: 'Source' }),
    defineField({ name: 'notionId', type: 'string', title: 'Notion ID' }),
    defineField({ name: 'publishedAt', type: 'datetime', title: 'Published at' }),
  ],
})

