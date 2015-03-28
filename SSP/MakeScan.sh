#!/bin/bash
(
math8 << IN
<<"SSP.m";
If[\$VersionNumber<=6,
Print["Needs at least Mathematica 7"];,
SetOption[ListPlot,DisplayFunction->Identity];
SetOption[ContourPlot,DisplayFunction->Identity];
SetOption[ContourPlot,DisplayFunction->Identity];
Start["$*"];
];
Exit;
IN
)
