topicApp = angular.module('topicApp')
topicApp.controller('IndexOpinionController', ['Opinions',
  (Opinions) ->
    vm = this

    vm.modal_opinion = {}

    loadOpinions = () ->
      vm.pro_opinions = Opinions.query(topic_id: gon.topic_id, is_pro: true)
      vm.con_opinions = Opinions.query(topic_id: gon.topic_id, is_pro: false)

    vm.showFullOpinion = (opinion) ->
      console.log(opinion)
      vm.modal_opinion = opinion
      $('#opinion-detail').modal('show')
      return

    loadOpinions()

    return vm
])