  $ ../../main.exe input.re -o actual.mlx
  $ diff -u output.mlx actual.mlx

  $ ../../main.exe melange_only.re -o melange_only.actual.mlx
  $ diff -u melange_only.mlx melange_only.actual.mlx

  $ ../../main.exe melange_only_local.re -o melange_only_local.actual.mlx
  $ diff -u melange_only_local.mlx melange_only_local.actual.mlx

  $ ../../main.exe platform.re -o platform.actual.mlx
  $ diff -u platform.mlx platform.actual.mlx

  $ ../../main.exe labelled_apply.re -o labelled_apply.actual.mlx
  $ diff -u labelled_apply.mlx labelled_apply.actual.mlx
