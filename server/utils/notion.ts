import { Client } from '@notionhq/client'

export const notion = new Client({ auth: process.env.NOTION_TOKEN })

export async function fetchDatabase(databaseId: string) {
  if (!databaseId) return { results: [] as any[] }
  return notion.databases.query({ database_id: databaseId })
}

export async function fetchPageBlocks(pageId: string) {
  return notion.blocks.children.list({ block_id: pageId })
}

export function notionBlocksToPortableText(blocks: any[]): any[] {
  const out: any[] = []
  for (const b of blocks) {
    switch (b.type) {
      case 'paragraph': {
        const text = (b.paragraph?.rich_text || []).map((t: any) => ({
          _type: 'span',
          text: t.plain_text || '',
          marks: [],
        }))
        out.push({ _type: 'block', style: 'normal', children: text })
        break
      }
      case 'heading_1':
      case 'heading_2':
      case 'heading_3': {
        const text = (b[b.type]?.rich_text || []).map((t: any) => ({ _type: 'span', text: t.plain_text || '', marks: [] }))
        const style = b.type === 'heading_1' ? 'h1' : b.type === 'heading_2' ? 'h2' : 'h3'
        out.push({ _type: 'block', style, children: text })
        break
      }
      case 'bulleted_list_item':
      case 'numbered_list_item': {
        const text = (b[b.type]?.rich_text || []).map((t: any) => ({ _type: 'span', text: t.plain_text || '', marks: [] }))
        out.push({ _type: 'block', style: 'normal', listItem: b.type === 'bulleted_list_item' ? 'bullet' : 'number', children: text })
        break
      }
      case 'quote': {
        const text = (b.quote?.rich_text || []).map((t: any) => ({ _type: 'span', text: t.plain_text || '', marks: [] }))
        out.push({ _type: 'block', style: 'blockquote', children: text })
        break
      }
      case 'image': {
        const url = b.image?.type === 'external' ? b.image.external.url : b.image?.file?.url
        if (url) {
          out.push({ _type: 'image', asset: { _type: 'reference', _ref: url } })
        }
        break
      }
      case 'embed': {
        const url = b.embed?.url
        if (url) out.push({ _type: 'block', style: 'normal', children: [{ _type: 'span', text: url, marks: [] }] })
        break
      }
      default: {
        // Fallback: flatten unsupported block types to simple text
        const rich = (b[b.type]?.rich_text || [])
        if (rich.length) {
          const text = rich.map((t: any) => ({ _type: 'span', text: t.plain_text || '', marks: [] }))
          out.push({ _type: 'block', style: 'normal', children: text })
        }
      }
    }
  }
  return out
}

