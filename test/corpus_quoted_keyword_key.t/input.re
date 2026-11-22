let title = (growth: Growth.t) => {
  let values = {
    "days": growth.windowDays->Int.toString->RR.s,
    "from": Format.day(growth.comparedTo)->RR.s,
    "to": Format.day(growth.asOf)->RR.s,
  };
  [%intl.el
    {
      msg: {js|{days}-day growth · {from} → {to}|js},
      desc: "Growth grid heading on the UGC Citations Report",
    }
  ] @@
  values;
};
