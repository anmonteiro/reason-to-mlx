let view = value => {
  <Text>
    {[%intl.el {js|Value: {value}|js}] @@ {"value": <Text> value </Text>}}
  </Text>;
  // Trailing JSX comment.
};
