let createResource =
    (~collection, ~ownerAccess, ~participantAccess, ~resourceName, ~scheme, ~destination, ~personalKey, ~priorityInfo, ()) => {
  let (resolvedOwnerAccess, resolvedParticipantAccess) = switch (collection) {
  | Some(_) => (None, [])
  | None => (ownerAccess, participantAccess)
  };
  NetworkClient.performResult(
    CreateResourceRequest.request(),
    {
      resourceName,
      scheme,
      destination,
      ownerAccess: resolvedOwnerAccess,
      participantAccess:
        resolvedParticipantAccess->List.map((({memberKey, _}, accessLevel)) => (memberKey, accessLevel)),
      personalKey,
      collection,
      priority: PrioritySettings.resolve(priorityInfo),
    },
  );
};
