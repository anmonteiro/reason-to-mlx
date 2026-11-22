let f = () =>
  <Checkbox
    status=s
    label={
      // note
      <Flex> <Text /> </Flex>
    }
    checked
    onChange={_ => foo()}
  />;
