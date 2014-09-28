topicApp = angular.module('topicApp')
topicApp.controller('ShowTopicController', ['TopicVotes',
  (TopicVotes) ->

    vm = this

    vm.voteImgStyle = {
      'width': '30px',
      'height': '35px'
    }

    unvote = () ->
      v = new TopicVotes({type: 'unvote'})
      v.$save({topic_id: gon.topic_id},
      (data, header) ->
        vm.vote = data
        (data ,header) ->
          if(data.status = 401)
            alert("You are not authorized to vote this item")
          else
            alert("You need to log in to vote"))

    vm.vote_up = () ->
      if(vm.vote.my_vote_status == 'up')
        unvote()
      else
        v = new TopicVotes({type: 'up'})
        v.$save({topic_id: gon.topic_id},
          (data, header) ->
            vm.vote = data
            (data ,header) ->
              if(data.status = 401)
                alert("You are not authorized to vote this item")
              else
                alert("You need to log in to vote"))

    vm.vote_down = () ->
      if(vm.vote.my_vote_status == 'down')
        unvote()
      else
        v = new TopicVotes({type: 'down'})
        v.$save({topic_id: gon.topic_id},
        (data, header) ->
          vm.vote = data
          (data ,header) ->
            if(data.status = 401)
              alert("You are not authorized to vote this item")
            else
              alert("You need to log in to vote"))

    vm.vote = TopicVotes.query({topic_id: gon.topic_id})

    return vm
])
