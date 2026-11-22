/* Reduced from AgentEngineFrame.re: a
   variant type named `effect` (OCaml 5's effect-handler keyword, a plain
   Reason identifier) used as a record field's element type via
   `list(effect)`, the shape that crashed the converter before it could emit
   any output at all (see Bug 1 in the bug hunt report). */
type browserTask =
  | ReadPageState
  | RunUiAct(string);

type effect =
  | AnswerBrowserTool(browserTask)
  | SessionTitled(string);

type outcome = {
  actions: list(string),
  effects: list(effect),
  progress: bool,
};

let inert = {actions: [], effects: [], progress: true};

let act = (action) => {
  actions: [action],
  effects: [],
  progress: true,
};

let answerWith = (task) => {
  actions: [],
  effects: [AnswerBrowserTool(task)],
  progress: true,
};
