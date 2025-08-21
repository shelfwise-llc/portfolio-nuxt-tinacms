import {defineField, defineType} from 'sanity'

export default defineType({
  name: 'page',
  title: 'Page',
  type: 'document',
  fields: [
    defineField({ name: 'title', type: 'string', title: 'Title' }),
    defineField({ name: 'slug', type: 'slug', title: 'Slug', options: { source: 'title', maxLength: 96 } }),
    defineField({ name: 'content', type: 'array', of: [{ type: 'block' }], title: 'Content' }),
    defineField({ name: 'publishedAt', type: 'datetime', title: 'Published at' }),
  ],
})
