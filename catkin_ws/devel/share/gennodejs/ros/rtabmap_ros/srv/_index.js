
"use strict";

let ResetPose = require('./ResetPose.js')
let GetMap = require('./GetMap.js')
let ListLabels = require('./ListLabels.js')
let GetPlan = require('./GetPlan.js')
let SetGoal = require('./SetGoal.js')
let SetLabel = require('./SetLabel.js')
let PublishMap = require('./PublishMap.js')
let AddLink = require('./AddLink.js')

module.exports = {
  ResetPose: ResetPose,
  GetMap: GetMap,
  ListLabels: ListLabels,
  GetPlan: GetPlan,
  SetGoal: SetGoal,
  SetLabel: SetLabel,
  PublishMap: PublishMap,
  AddLink: AddLink,
};
