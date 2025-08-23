import { getClient } from '~/tina/__generated__/client'
import { client as serverClient } from '~/server/utils/tina'

export interface Post {
  title: string
  slug: string
  description?: string
  date: string
  tags?: string[]
  featuredImage?: string
  body: string
}

export interface Page {
  title: string
  slug: string
  description?: string
  body: string
}

export interface CaseStudy {
  title: string
  slug: string
  client?: string
  duration?: number
  role?: string
  description?: string
  heroImage?: string
  body: string
}

export function useTinaContent() {
  // Fetch a single page by slug
  const getPage = async (slug: string): Promise<Page | null> => {
    try {
      const tinaClient = await getClient()
      const pageResponse = await tinaClient.queries.page({ relativePath: `${slug}.md` })
      if (!pageResponse.data?.page) return null
      
      const page = pageResponse.data.page
      return {
        title: page.title,
        slug,
        description: page.description || '',
        body: page.body
      }
    } catch (error) {
      console.error('Error fetching page:', error)
      return null
    }
  }

  // Fetch all pages
  const getAllPages = async (): Promise<Page[]> => {
    try {
      const tinaClient = await getClient()
      const pagesResponse = await tinaClient.queries.pageConnection()
      return pagesResponse.data.pageConnection.edges.map((edge: any) => {
        const page = edge.node
        return {
          title: page.title,
          slug: page._sys.filename,
          description: page.description || '',
          body: page.body
        }
      })
    } catch (error) {
      console.error('Error fetching pages:', error)
      return []
    }
  }

  // Fetch a single post by slug
  const getPost = async (slug: string): Promise<Post | null> => {
    try {
      const tinaClient = await getClient()
      const postResponse = await tinaClient.queries.post({ relativePath: `${slug}.md` })
      if (!postResponse.data?.post) return null
      
      const post = postResponse.data.post
      return {
        title: post.title,
        slug,
        description: post.description || '',
        date: post.date || new Date().toISOString(),
        tags: post.tags || [],
        featuredImage: post.featuredImage,
        body: post.body
      }
    } catch (error) {
      console.error('Error fetching post:', error)
      return null
    }
  }

  // Fetch all posts sorted by date
  const getAllPosts = async (): Promise<Post[]> => {
    try {
      const tinaClient = await getClient()
      const postsResponse = await tinaClient.queries.postConnection()
      return postsResponse.data.postConnection.edges
        .map((edge: any) => {
          const post = edge.node
          return {
            title: post.title,
            slug: post._sys.filename,
            description: post.description || '',
            date: post.date || new Date().toISOString(),
            tags: post.tags || [],
            featuredImage: post.featuredImage,
            body: post.body
          }
        })
        .sort((a: Post, b: Post) => new Date(b.date).getTime() - new Date(a.date).getTime())
    } catch (error) {
      console.error('Error fetching all posts:', error)
      return []
    }
  }

  // Fetch a single case study by slug
  const getCaseStudy = async (slug: string): Promise<CaseStudy | null> => {
    try {
      const tinaClient = await getClient()
      const caseStudyResponse = await tinaClient.queries.caseStudy({ relativePath: `${slug}.md` })
      if (!caseStudyResponse.data?.caseStudy) return null
      
      const caseStudy = caseStudyResponse.data.caseStudy
      return {
        title: caseStudy.title,
        slug,
        client: caseStudy.client,
        duration: caseStudy.duration,
        role: caseStudy.role,
        description: caseStudy.description,
        heroImage: caseStudy.heroImage,
        body: caseStudy.body
      }
    } catch (error) {
      console.error('Error fetching case study:', error)
      return null
    }
  }

  // Fetch all case studies
  const getAllCaseStudies = async (): Promise<CaseStudy[]> => {
    try {
      const tinaClient = await getClient()
      const caseStudiesResponse = await tinaClient.queries.caseStudyConnection()
      return caseStudiesResponse.data.caseStudyConnection.edges.map((edge: any) => {
        const caseStudy = edge.node
        return {
          title: caseStudy.title,
          slug: caseStudy._sys.filename,
          client: caseStudy.client,
          duration: caseStudy.duration,
          role: caseStudy.role,
          description: caseStudy.description,
          heroImage: caseStudy.heroImage,
          body: caseStudy.body
        }
      })
    } catch (error) {
      console.error('Error fetching all case studies:', error)
      return []
    }
  }

  return {
    getPage,
    getPost,
    getAllPosts,
    getAllPages,
    getCaseStudy,
    getAllCaseStudies
  }
}
