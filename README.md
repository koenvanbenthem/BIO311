# Bio 311 course material

This repository contains the documents for the population ecology course that is taught at the university of Zurich in the spring semeter 2016. 

Every practical has their own folder. The first practical is a 'pen and paper' refresher of mathematics. This practical is in the 'Intro' folder. The concerning file is the .tex file. We would not let the students solve every single exercise, instead we would decide on a subset of the exercises (at least one from every section) and leave the other exercises for additional practice. In the last section (eigenvalue and eigenvectors) we usually let the students do all exercises (since our experience is that they find this part the hardest).

The other practicals should be in folder Prac6 -- Prac10. These practicals are written as knitr files (I believe that's the term). The main file is always the .rnw file (we were a bit chaotic at the time, I cannot exclude the possibility that some folders contain two .rnw files, only one of them being what we used in the course so far). We used to compile these in RStudio.

# Important information on exercises
For the pen and paper exercises (they occur in multiple practicals) we used the exercise package ( http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/exercise/exercise.pdf ). When specifying an exercise with answer, you use:
```latex
\begin{Exercise}[title=bla,label=ex1]
the text for the exercise
\end{Exercise}
\begin{Answer}[ref=ex1]
the text for the answer
\end{Answer}
```

When the exercise package is loaded, with an option, you can specify how the answers should be displayed, the three options that we used are:

`\usepackage[answerdelayed]{exercise}`

the answer of all exercises are printed at the end of the pdf

`\usepackage{exercise}`

the answer of every exercise is printed directly after the exercise

`\usepackage[noanswer]{exercise}`

the answers are not printed at all
