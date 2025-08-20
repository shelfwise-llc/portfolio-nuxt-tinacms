import { Client } from '@notionhq/client'

export const notion = new Client({ auth: process.env.NOTION_TOKEN })

export async function fetchDatabase(databaseId: string) {
  if (!databaseId) return { results: [] as any[] }
  return notion.databases.query({ database_id: databaseId })
}

export async function fetchPageBlocks(pageId: string) {
  return notion.blocks.children.list({ block_id: pageId })
}

