import { useSanity as useNuxtSanity } from '#imports'
import groq from 'groq'
import type { PortableTextBlock } from '@portabletext/types'

export interface Post {
  _id: string
  title: string
  slug: {
    current: string
  }
  excerpt?: string
  body: PortableTextBlock[]
  publishedAt: string
}

export interface Page {
  _id: string
  title: string
  slug: {
    current: string
  }
  content: PortableTextBlock[]
  publishedAt: string
}

export interface CaseStudy {
  _id: string
  title: string
  slug: {
    current: string
  }
  excerpt?: string
  category?: string
  type?: string
  icon?: string
  year?: string
  duration?: string
  featured?: boolean
  content: PortableTextBlock[]
  publishedAt: string
}

export function useSanityContent() {
  const { client } = useNuxtSanity()

  // Fetch a single page by slug
  const getPage = async (slug: string): Promise<Page | null> => {
    try {
      const query = groq`*[_type == "page" && slug.current == $slug][0]`
      return await client.fetch(query, { slug })
    } catch (error) {
      console.error('Error fetching page:', error)
      return null
    }
  }

  // Fetch all pages
  const getAllPages = async (): Promise<Page[]> => {
    try {
      const query = groq`*[_type == "page" && defined(slug.current)] | order(title asc)`
      return await client.fetch(query)
    } catch (error) {
      console.error('Error fetching pages:', error)
      return []
    }
  }

  // Fetch a single post by slug
  const getPost = async (slug: string): Promise<Post | null> => {
    try {
      const query = groq`*[_type == "post" && slug.current == $slug][0]`
      return await client.fetch(query, { slug })
    } catch (error) {
      console.error('Error fetching post:', error)
      return null
    }
  }

  // Fetch all posts sorted by publishedAt date
  const getAllPosts = async (): Promise<Post[]> => {
    try {
      const query = groq`*[_type == "post" && defined(slug.current)] | order(publishedAt desc)`
      return await client.fetch(query)
    } catch (error) {
      console.error('Error fetching all posts:', error)
      return []
    }
  }

  // Fetch a single case study by slug
  const getCaseStudy = async (slug: string): Promise<CaseStudy | null> => {
    try {
      const query = groq`*[_type == "caseStudy" && slug.current == $slug][0]`
      return await client.fetch(query, { slug })
    } catch (error) {
      console.error('Error fetching case study:', error)
      return null
    }
  }

  // Fetch all case studies sorted by publishedAt date
  const getAllCaseStudies = async (): Promise<CaseStudy[]> => {
    try {
      const query = groq`*[_type == "caseStudy" && defined(slug.current)] | order(publishedAt desc)`
      return await client.fetch(query)
    } catch (error) {
      console.error('Error fetching all case studies:', error)
      return []
    }
  }

  // Fetch featured case study
  const getFeaturedCaseStudy = async (): Promise<CaseStudy | null> => {
    try {
      const query = groq`*[_type == "caseStudy" && featured == true][0]`
      return await client.fetch(query)
    } catch (error) {
      console.error('Error fetching featured case study:', error)
      return null
    }
  }

  return {
    getPage,
    getPost,
    getAllPosts,
    getAllPages,
    getCaseStudy,
    getAllCaseStudies,
    getFeaturedCaseStudy
  }
}
