const express = require('express')
const passport = require('passport')
const BlogPost = require('../models/blogpost')
const customErrors = require('../../lib/custom_errors')
const handle404 = customErrors.handle404
const requireOwnership = customErrors.requireOwnership
const requireToken = passport.authenticate('bearer', { session: false })
const removeBlanks = require('../../lib/remove_blank_fields')

const router = express.Router()

router.get('/blogposts', (req, res, next) => {
  BlogPost.find().sort('-createdAt')
    .populate('owner')
    .then(posts => {
      return posts.map(post => post.toObject())
    })
    .then(posts => res.status(200).json({ posts: posts }))
    .catch(next)
})

router.get('/blogposts/:id', (req, res, next) => {
  BlogPost.findById(req.params.id)
    .then(handle404)
    .then(post => res.status(200).json({ post: post.toObject() }))
    .catch(next)
})

router.delete('/blogposts/:id', requireToken, (req, res, next) => {
  BlogPost.findById(req.params.id)
    .then(handle404)
    .then(blogpost => {
      // needs the req to get the user to compare against the owner of the book resource
      requireOwnership(req, blogpost)
      blogpost.remove()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.patch('/blogposts/:id', requireToken, removeBlanks, (req, res, next) => {
  delete req.body.blogpost.owner
  // Don't need to actually call removeBlanks inside once you pass it in as a
  // parameter

  BlogPost.findById(req.params.id)
    .then(handle404)
    .then(post => {
      requireOwnership(req, post)
      return post.update(req.body.blogpost)
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.post('/blogposts', requireToken, (req, res, next) => {
  req.body.blogpost.owner = req.user.id
  BlogPost.create(req.body.blogpost)
    .then(blogpost => {
      res.status(201).json({ blogpost: blogpost.toObject() })
    })
    .catch(next)
})

module.exports = router
