// Mock TinaCMS client for build time
import { queries } from './__generated__/types';

// Create a mock client that will be used during build time
export const createClient = (options: any) => {
  return {
    request: async ({ query, variables }: { query: string; variables?: any }) => {
      console.warn('Using mock TinaCMS client');
      return { data: {} };
    },
    queries
  };
};

// Export a function that returns the mock client
export async function getClient() {
  return {
    request: async ({ query, variables }: { query: string; variables?: any }) => {
      console.warn('Using mock TinaCMS client');
      return { data: {} };
    },
    queries
  };
}

export default getClient;
