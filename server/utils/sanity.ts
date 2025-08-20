import { createClient } from '@sanity/client'

export function getSanityClient(dataset: string) {
  const projectId = process.env.SANITY_PROJECT_ID
  const token = process.env.SANITY_API_TOKEN
  const apiVersion = process.env.SANITY_API_VERSION || '2023-10-01'
  if (!projectId || !token) {
    throw new Error('Missing SANITY_PROJECT_ID or SANITY_API_TOKEN')
  }
  return createClient({ projectId, dataset, apiVersion, token, useCdn: false })
}

