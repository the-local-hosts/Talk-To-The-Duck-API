const mongoose = require('mongoose')

const commentSchema = new mongoose.Schema({
  comment: {
    type: String,
    required: true
  },
  blogpost: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'BlogPost',
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
},
{
  timestamps: true,
  toObject: {
    virtuals: true
  }
}
)

// blogPostSchema.virtual('editable?').get(function () {
//   // Need to compare this to currently logged in user's id to see if
//   // the owner of the blog post is the currently logged in user.
//   if (this.owner._id) {
//     return true
//   } else {
//     return false
//   }
// })

module.exports = mongoose.model('Comment', commentSchema)
