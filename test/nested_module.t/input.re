module WorkspaceLoader = {
  module Contract = FetchWorkspaceContract;
  let fetchWorkspace = (channel: Contract.channel) =>
    Transport.send(
      Contract.make(),
      {
        channel,
        returnTo: Summary,
      },
    );
};
