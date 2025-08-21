import {defineField, defineType} from 'sanity'

export default defineType({
  name: 'caseStudy',
  title: 'Case Study',
  type: 'document',
  fields: [
    defineField({ name: 'title', type: 'string', title: 'Title' }),
    defineField({ name: 'slug', type: 'slug', title: 'Slug', options: { source: 'title', maxLength: 96 } }),
    defineField({ name: 'excerpt', type: 'text', title: 'Excerpt' }),
    defineField({ name: 'category', type: 'string', title: 'Category' }),
    defineField({ name: 'type', type: 'string', title: 'Type' }),
    defineField({ name: 'icon', type: 'string', title: 'Icon' }),
    defineField({ name: 'year', type: 'string', title: 'Year' }),
    defineField({ name: 'duration', type: 'string', title: 'Duration' }),
    defineField({ name: 'featured', type: 'boolean', title: 'Featured', initialValue: false }),
    defineField({
      name: 'content',
      title: 'Content',
      type: 'array',
      of: [
        { type: 'block' },
      ],
    }),
    defineField({ name: 'publishedAt', type: 'datetime', title: 'Published at' }),
  ],
})
