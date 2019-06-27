const mongoose = require('mongoose')

const blogPostSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  postBody: {
    type: String,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  comments: [{
    text: String,
    postedBy: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User'
    }
  }]
},
{
  timestamps: true,
  toObject: {
    virtuals: true
  }
})

// blogPostSchema.virtual('editable?').get(function () {
//   // Need to compare this to currently logged in user's id to see if
//   // the owner of the blog post is the currently logged in user.
//   if (this.owner._id) {
//     return true
//   } else {
//     return false
//   }
// })

module.exports = mongoose.model('BlogPost', blogPostSchema)
