  $ ../../main.exe tilde.re -o actual.mlx
  reason-to-mlx: tilde.re:1: the converted text does not parse after placing
                 the comment here (line 1 of the text after placing comments:
                 let a = f (~ (* K1 *) ((title))) ~content)
  [124]
  $ ../../main.exe tilde_line.re -o actual.mlx
  reason-to-mlx: tilde_line.re:1: the converted text does not parse after
                 placing the comment here (line 1 of the text after placing
                 comments: let a = f ~content ((((~))(* K2 *)) name))
  [124]
  $ ../../main.exe module.re -o actual.mlx
  reason-to-mlx: module.re:1: the Reason printer dropped the marker that
                 carries this comment (comment: K3)
  [124]
