type action =
  | ModalOpened(string)
  // documents SetLabelName
  | SetLabelName(string)
  | SubmitStart(string)
  // one
  // two
  | SubmitFailedCommon;

type longFieldNames = {
  firstLongFieldName: int,
  // documents secondLongFieldName
  secondLongFieldName: int,
  thirdLongFieldName: int,
  // one
  // two
  fourthLongFieldName: int,
};
