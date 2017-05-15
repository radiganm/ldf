{% set one = '{#1}' %}
---
title: Learning From Data - worked examples
author: Mac Radigan
header-includes:
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{minted}
 - \usepackage[skins,minted]{tcolorbox}
 - \usepackage{mdframed}

 - \definecolor{pythonbg}{rgb}{0.95,0.95,0.95}
 - \newcommand{\pythonlist}[1]{
   \begin{mdframed}[linecolor=black, topline=true, bottomline=true, leftline=false, rightline=false, backgroundcolor=pythonbg]
   \inputminted[
     fontfamily=tt,
     fontsize=\footnotesize,
     linenos=true,
     numberblanklines=true,
     numbersep=12pt,
     numbersep=5pt,
     frame=leftline,
     breaklines=true
   ]{python}{{one}}
   \end{mdframed}
  }

 - \definecolor{octavebg}{rgb}{0.95,0.95,0.95}
 - \newcommand{\octavelist}[1]{
   \begin{mdframed}[linecolor=black, topline=true, bottomline=true, leftline=false, rightline=false, backgroundcolor=octavebg]
   \inputminted[
     fontfamily=tt,
     fontsize=\footnotesize,
     linenos=true,
     numberblanklines=true,
     numbersep=12pt,
     numbersep=5pt,
     frame=leftline,
     breaklines=true
   ]{octave}{{one}}
   \end{mdframed}
  }
---
