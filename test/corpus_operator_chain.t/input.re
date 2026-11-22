let styles = (~basis, ~grow, ~shrink, ~margin, ~padding, ~width, ~height) =>
  base
  +++ basis->Cn.mapSome(FlexBasis.toStyle)
  +++ grow->Cn.mapSome(FlexGrow.toStyle)
  +++ shrink->Cn.mapSome(FlexShrink.toStyle)
  +++ margin->Cn.mapSome(Margin.toStyle)
  +++ padding->Cn.mapSome(Padding.toStyle)
  +++ width->Cn.mapSome(Width.toStyle)
  +++ height->Cn.mapSome(Height.toStyle);
