import { defineEventHandler, readBody } from 'h3'

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event)
    
    // You can validate the webhook with a secret if needed
    // const signature = event.node.req.headers['tina-webhook-signature']
    // if (!validateSignature(signature, body, process.env.NUXT_TINA_WEBHOOK_SECRET)) {
    //   return { statusCode: 401, body: 'Invalid signature' }
    // }
    
    console.log('TinaCMS webhook received:', body)
    
    // Here you would trigger your deployment process
    // This could be a call to Netlify, Vercel, or your own CI/CD system
    // For example:
    // await fetch('https://api.netlify.com/build_hooks/your-build-hook-id', {
    //   method: 'POST'
    // })
    
    return { 
      statusCode: 200, 
      body: 'Webhook received and deployment triggered' 
    }
  } catch (error) {
    console.error('Error processing TinaCMS webhook:', error)
    return { 
      statusCode: 500, 
      body: 'Error processing webhook' 
    }
  }
})
