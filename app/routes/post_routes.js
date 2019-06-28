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
    .populate('owner', 'name')
    .populate('comments.postedBy', 'name')
    .then(posts => {
      console.log(posts)
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

// Comments and likes routes
// BlogPost.findById(req.params.post_id)
//   .then(handle404)
//   .then(post => {
//     post.update({'comments.$._id': req.params.id}, {'$set': {
//       'text': req.body.comment
//     }})
//     console.log(post)
//     return post
//   })
//   .then(() => res.sendStatus(204))
//   .catch(next)
// BlogPost.findById(req.params.post_id)
//   .then(handle404)
//   .then(post => {
//     return post.update({comments: {'_id': req.params.id}}, {'$set': {'text.$': req.body.comment}})
//   })
//   .then(() => res.sendStatus(204))
//   .catch(next)

router.post('/blogposts/:post_id/comments', requireToken, removeBlanks, (req, res, next) => {
  BlogPost.findById(req.params.post_id)
    .then(handle404)
    .then(post => {
      return post.update({'$push': { 'comments': { text: req.body.comment, postedBy: req.user.id } }})
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.delete('/blogposts/:post_id/comments/:id', requireToken, (req, res, next) => {
  BlogPost.findById(req.params.post_id)
    .then(handle404)
    .then(post => {
      return post.update({'$pull': { 'comments': {_id: req.params.id} }})
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.patch('/blogposts/:post_id/comments/:id', requireToken, (req, res, next) => {
})

// router.post('/blogpost/:post_id/likes/', requireToken, (req, res, next) => {
// })
//
// router.patch('/blogpost/:post_id/likes/:id', requireToken, (req, res, next) => {
// })

module.exports = router
