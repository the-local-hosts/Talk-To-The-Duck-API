const express = require('express')
const passport = require('passport')
const Comment = require('../models/comment')
const customErrors = require('../../lib/custom_errors')
const handle404 = customErrors.handle404
const requireOwnership = customErrors.requireOwnership
const requireToken = passport.authenticate('bearer', { session: false })
const removeBlanks = require('../../lib/remove_blank_fields')

const router = express.Router()

router.get('/comments', (req, res, next) => {
  Comment.find()
    .populate('owner')
    .populate('blogpost')
    .then(comments => {
      return comments.map(comment => comment.toObject())
    })
    .then(comments => res.status(200).json({ comments: comments }))
    .catch(next)
})

router.get('/comments/:id', (req, res, next) => {
  Comment.findById(req.params.id)
    .then(handle404)
    .then(comment => res.status(200).json({ comment: comment.toObject() }))
    .catch(next)
})

router.delete('/comments/:id', requireToken, (req, res, next) => {
  Comment.findById(req.params.id)
    .then(handle404)
    .then(comment => {
      requireOwnership(req, comment)
      comment.remove()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.patch('/comments/:id', requireToken, removeBlanks, (req, res, next) => {
  delete req.body.comment.owner
  delete req.body.comment.blogpost

  Comment.findById(req.params.id)
    .then(handle404)
    .then(comment => {
      requireOwnership(req, comment)
      return comment.update(req.body.comment)
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.post('/comments', requireToken, (req, res, next) => {
  console.log('request is ' + req.body)
  req.body.comment.owner = req.user.id
  Comment.create(req.body.comment)
    .then(comment => {
      res.status(201).json({ comment: comment.toObject() })
    })
    .catch(next)
})

module.exports = router
