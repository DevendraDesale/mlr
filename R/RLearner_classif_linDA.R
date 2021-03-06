#' @export
makeRLearner.classif.linDA = function() {
  makeRLearnerClassif(
    cl = "classif.linDA",
    package = "DiscriMiner",
    par.set = makeParamSet(
      #makeNumericVectorLearnerParam(id = "prior", lower = 0, upper = 1, default = NULL),
      ),
    properties = c("twoclass", "multiclass", "numerics"),
    name = "Linear Discriminant Analysis",
    short.name = "linda",
    note = ""
  )
}

#' @export
trainLearner.classif.linDA = function(.learner, .task, .subset, .weights = NULL,  ...) {
  d = getTaskData(.task, .subset, target.extra = TRUE)
  DiscriMiner::linDA(variables = d$data, group = d$target, ...)
}

#' @export
predictLearner.classif.linDA = function(.learner, .model, .newdata, ...) {
  m = .model$learner.model
  p = DiscriMiner::classify(m, newdata = .newdata)
  #p$scores #we loose this information
  p$pred_class
}
