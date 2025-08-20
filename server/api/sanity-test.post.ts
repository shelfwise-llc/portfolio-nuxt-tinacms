import { getSanityClient } from '~/server/utils/sanity'

export default defineEventHandler(async () => {
  const dataset = process.env.SANITY_DATASET_PORTFOLIO || 'portfolio'
  const sanity = getSanityClient(dataset)
  const now = new Date().toISOString()
  const res = await sanity.create({
    _type: 'post',
    title: `Test post ${now}`,
    slug: { current: `test-${now.replace(/[:.]/g, '-')}` },
    excerpt: 'Sanity write test',
    source: 'test',
  })
  return { ok: true, id: res._id }
})

