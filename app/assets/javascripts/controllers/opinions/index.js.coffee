topicApp = angular.module('topicApp')
topicApp.controller('IndexOpinionController', ['Opinions',
  (Opinions) ->
    vm = this

    loadOpinions = () ->
      vm.pro_opinions = Opinions.query(topic_id: gon.topic_id, is_pro: true)
      vm.con_opinions = Opinions.query(topic_id: gon.topic_id, is_pro: false)

    loadOpinions()

    return vm
])