import 'dotenv/config'

const url = process.env.SYNC_ENDPOINT || 'http://localhost:3333/api/sync-notion'

async function run() {
  const res = await fetch(url, { method: 'POST' })
  if (!res.ok) {
    const text = await res.text()
    throw new Error(`Sync failed: ${res.status} ${text}`)
  }
  const data = await res.json()
  console.log('Sync complete:', JSON.stringify(data, null, 2))
}

run().catch((e) => {
  console.error(e)
  process.exit(1)
})

