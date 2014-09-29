topicApp = angular.module('topicApp')
topicApp.controller('ShowOpinionController', ['OpinionVotes',
  (OpinionVotes) ->

    vm = this

    vm.voteImgStyle = {
      'width': '30px',
      'height': '35px'
    }

    unvote = () ->
      v = new OpinionVotes({type: 'unvote'})
      v.$save({topic_id: gon.topic_id, opinion_id: gon.opinion_id},
      (data, header) ->
        vm.vote = data
      (data ,header) ->
        if(data.status = 401)
          alert("You are not authorized to vote this item. Please log in")
        else
          alert("You need to log in to vote"))

    vm.vote_up = () ->
      if(vm.vote.my_vote_status == 'up')
        unvote()
      else
        v = new OpinionVotes({type: 'up'})
        v.$save({topic_id: gon.topic_id, opinion_id: gon.opinion_id},
        (data, header) ->
          vm.vote = data
        (data ,header) ->
          if(data.status = 401)
            alert("You are not authorized to vote this item. Please log in")
          else
            alert("You need to log in to vote"))

    vm.vote_down = () ->
      if(vm.vote.my_vote_status == 'down')
        unvote()
      else
        v = new OpinionVotes({type: 'down'})
        v.$save({topic_id: gon.topic_id, opinion_id: gon.opinion_id},
        (data, header) ->
          vm.vote = data
        (data ,header) ->
          if(data.status = 401)
            alert("You are not authorized to vote this item. Please log in")
          else
            alert("You need to log in to vote"))

    vm.vote = OpinionVotes.query({topic_id: gon.topic_id, opinion_id: gon.opinion_id})

    return vm
])
