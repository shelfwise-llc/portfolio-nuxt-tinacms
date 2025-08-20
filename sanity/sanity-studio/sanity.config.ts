import {defineConfig} from 'sanity'
import {structureTool} from 'sanity/structure'
import {visionTool} from '@sanity/vision'
import {schemaTypes} from './schemaTypes'
import {workflow} from 'sanity-plugin-workflow'

export default defineConfig({
  name: 'default',
  title: 'NuxtPortfolio',

  projectId: 'k43kgsoq',
  dataset: 'portfolio',

  plugins: [structureTool(), visionTool(), workflow({ schemaTypes: ['post'] })],

  schema: {
    types: schemaTypes,
  },
})
