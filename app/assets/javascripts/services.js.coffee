opinionServices = angular.module('opinionServices', ['ngResource'])
opinionServices.factory "Opinions",
  ["$resource", ($resource) -> return $resource("/api/v1/topics/:topic_id/opinions", {},
    query: {method: "GET", isArray: false}
  )]

voteServices = angular.module('voteServices', ['ngResource'])
voteServices.factory "TopicVotes",
  ["$resource", ($resource) -> return $resource("/api/v1/topics/:topic_id/votes/", {},
    {
      'query': {method:'GET', isArray:false},
    }
  )]
voteServices.factory "OpinionVotes",
  ["$resource", ($resource) -> return $resource("/api/v1/topics/:topic_id/opinions/:opinion_id/votes/", {},
    {
      'query': {method:'GET', isArray:false},
    }
  )]