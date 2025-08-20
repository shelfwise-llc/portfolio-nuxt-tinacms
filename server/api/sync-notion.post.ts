import { getSanityClient } from '~/server/utils/sanity'
import { fetchDatabase } from '~/server/utils/notion'

function toPlainText(rich: any[] = []) {
  return (rich || []).map((r: any) => r?.plain_text || '').join('')
}

function pageToDoc(page: any) {
  const props = page?.properties || {}
  const title = toPlainText(props?.Name?.title || [])
  const slugBase = props?.Slug?.rich_text?.[0]?.plain_text || title || page?.id || ''
  const slug = String(slugBase).toLowerCase().trim().replace(/[^a-z0-9\s-]/g, '').replace(/\s+/g, '-').slice(0, 96)
  const status = props?.Status?.status?.name || props?.Status?.select?.name || 'Draft'
  const excerpt = toPlainText(props?.Excerpt?.rich_text || [])
  return { id: page?.id, title, slug, status, excerpt }
}

async function upsertDocs(datasetEnv: string, dbEnv: string) {
  const dataset = process.env[datasetEnv] || ''
  const dbId = process.env[dbEnv] || ''
  if (!dataset || !dbId) return { dataset, count: 0 }

  const sanity = getSanityClient(dataset)
  const { results } = await fetchDatabase(dbId) as any
  let count = 0
  for (const page of (results || [])) {
    const doc = pageToDoc(page)
    if (!doc.slug) continue
    if (doc.status !== 'Final' && doc.status !== 'Published') continue
    const _id = `notion.${doc.slug}`
    await sanity.createOrReplace({
      _id,
      _type: 'post',
      title: doc.title,
      slug: { current: doc.slug },
      excerpt: doc.excerpt,
      source: 'notion',
      notionId: doc.id,
    })
    count++
  }
  return { dataset, count }
}

export default defineEventHandler(async () => {
  const results = await Promise.all([
    upsertDocs('SANITY_DATASET_PORTFOLIO', 'NOTION_DB_PORTFOLIO'),
    upsertDocs('SANITY_DATASET_CLINIC', 'NOTION_DB_CLINIC'),
    upsertDocs('SANITY_DATASET_SHELFWISE', 'NOTION_DB_SHELFWISE'),
  ])
  return { ok: true, results }
})

