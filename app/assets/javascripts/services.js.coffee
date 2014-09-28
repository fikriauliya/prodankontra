opinionServices = angular.module('opinionServices', ['ngResource'])
opinionServices.factory "Opinions",
  ["$resource", ($resource) -> return $resource("/api/v1/topics/:topic_id/opinions", {},
    query: {method: "GET", isArray: false}
  )]
