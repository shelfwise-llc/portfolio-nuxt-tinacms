declare module 'tinacms' {
  export interface TinaClient {
    request: (options: { query: string; variables?: any }) => Promise<any>;
    queries: any;
  }
  
  export function createClient(options: {
    url?: string;
    token?: string;
    clientId?: string;
    branch?: string;
    queries?: any;
  }): TinaClient;

  export const createClient: typeof createClient;
  export default {
    createClient
  };
}

declare module 'tinacms/dist/client' {
  export * from 'tinacms';
}
