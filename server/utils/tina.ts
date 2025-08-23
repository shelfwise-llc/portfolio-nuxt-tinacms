// Server-side TinaCMS utilities
import { createClient } from 'tinacms';
import { queries } from '../../tina/__generated__/types';
import { useRuntimeConfig } from '#imports';

// Create a function to get the client
export async function getClient() {
  try {
    // Get config from runtime
    const config = useRuntimeConfig();
    
    // Use config values or fallbacks
    const token = config.tina?.token || '1c9285fd-fbf4-450f-8e0e-95f3ff06ad32';
    const clientId = config.public?.NUXT_PUBLIC_TINA_CLIENT_ID;
    
    if (!clientId && process.env.NODE_ENV === 'production') {
      console.warn('Missing TinaCMS client ID in production environment');
    }
    
    // Create client with appropriate configuration
    if (clientId) {
      return createClient({
        clientId: clientId,
        token: token,
        branch: 'main',
        queries
      });
    } else {
      // Fallback for local development
      return createClient({
        url: 'http://localhost:4001/graphql',
        token: token,
        queries
      });
    }
  } catch (error) {
    console.error('Error creating TinaCMS client:', error);
    // Return a minimal mock client as a last resort
    return {
      request: async ({ query, variables }: { query: string; variables?: any }) => ({ data: {} }),
      queries
    };
  }
}

// Export the client for easier usage
export const client = {
  async query(query: string, variables?: any) {
    const tinaClient = await getClient();
    return tinaClient.request({
      query,
      variables
    });
  }
};
