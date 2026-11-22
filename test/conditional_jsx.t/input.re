let controls = (~activeCredential, ~dialogOpen, ~chosenCredential, ~sendAction, ~saveCredential) =>
  activeCredential->Option.isNone
    ? ViewRuntime.null
    : <>
        <QuietButton color=Link onClick={_ => sendAction(UnlinkRequested)}>
          [%intl.el {js|Disconnect|js}]
        </QuietButton>
        <VerifyDialog
          title=[%intl.s {js|Disconnect account?|js}]
          isOpen=dialogOpen
          onClose={_ => sendAction(DialogDismissed)}
          onConfirm={_ => saveCredential(chosenCredential)}>
          [%intl.el {js|This workspace will no longer be connected.|js}]
        </VerifyDialog>
      </>;
