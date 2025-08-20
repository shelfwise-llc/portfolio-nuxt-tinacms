import { createClient } from "tinacms/dist/client";
import { queries } from "./types";
export const client = createClient({ url: 'http://localhost:4001/graphql', token: '1c9285fd-fbf4-450f-8e0e-95f3ff06ad32', queries,  });
export default client;
  