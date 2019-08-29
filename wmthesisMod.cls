%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%  File: wmthesis.cls
%%  $Original Id: wmthesis.cls,v 1.16 2003/12/30 02:16:08 norman Exp $
%%  $Id: wmthesis.cls,v 1.6 2011/02/11 23:35:27 sjc Exp $
%%
%%  Copyright (c) 1999 by Paul M. King.
%%  Modifications by Andrew J. Norman 2002-2003
%%  Modified slightly by Erik J. Spahr 2010 to account for required title page format. 
%%  Modified slightly by Nate Phillips 2011 to make title single-spaced, incorporate several GRS changes, and change the acknowledgements page so that GRS accepts it
%%  Modified slightly by Christopher Maher 2011 to adjust the spacing on the title page, as well as correct the roman numbering to begin properly at the TOC.
%%  Modified slightly by Travis Horrom 2013 to conform to standards.  Changed margins as well as spacing and title size for preliminary pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%  This file was generated from the file `book.cls'.
%% 
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{wmthesisMod}[2003/09/15 v1.12
                         College of William and Mary Thesis class]
%
% Use the TextCase package for special text caps (at least, for
% \maketitle below)
\usepackage{textcase}
\usepackage{setspace}  %%% added by Erik Spahr for single spacing on tittle page.  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand\@ptsize{}
\newcommand{\@defaultbaselinestretch}{1}
\newcommand{\@defaultparindent}{2em}
\newcommand{\@defaultrightskip}{\z@}
\newif\if@restonecol
\newif\if@draftdate \@draftdatefalse
\newif\if@titlepage
\@titlepagetrue
\newif\if@openbib
\@openbibfalse
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\newif\if@firstmain
\newif\if@appmatter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{singlespace}{\renewcommand{\@defaultbaselinestretch}{1}}
\DeclareOption{1.5space}
   {\ifnum\@ptsize=0 \renewcommand{\@defaultbaselinestretch}{1.25} \fi %
    \ifnum\@ptsize=1 \renewcommand{\@defaultbaselinestretch}{1.21} \fi %
    \ifnum\@ptsize=2 \renewcommand{\@defaultbaselinestretch}{1.24} \fi}
\DeclareOption{doublespace}
   {\ifnum\@ptsize=0 \renewcommand{\@defaultbaselinestretch}{1.67} \fi %
    \ifnum\@ptsize=1 \renewcommand{\@defaultbaselinestretch}{1.62} \fi %
    \ifnum\@ptsize=2 \renewcommand{\@defaultbaselinestretch}{1.66} \fi}
\DeclareOption{draftdate}{\@draftdatetrue}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExecuteOptions{letterpaper,10pt,doublespace,twoside,onecolumn,final,openright}

\ProcessOptions
\usepackage{calc}
\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{\@defaultbaselinestretch}
\normalsize
%% next set of lengths are set for 12pt only
%%Changed \topmargin, \textheight, \footskip, \headsep, \textwidth to shrink margins and conform to standards, These values worked for me, but could be changed, or use geometry package?.  TSH
\setlength{\oddsidemargin}{0.3in}
\setlength{\textwidth}{6.35in}

\setlength{\textheight}{8.75in - \topskip}   %Changed from 9.25in.  BCR
  \newcounter{tempc}   \setcounter{tempc}{\textheight}
  \newcounter{tempcc}  \setcounter{tempcc}{\baselineskip}
  \setcounter{tempc}{\value{tempc}/\value{tempcc}}
  \setlength{\textheight}{\baselineskip*\value{tempc}+\topskip}
\setlength{\topmargin}{-0.08in}
\setlength{\headheight}{\topskip}
\setlength{\headsep}{0.25in}%{ \paperheight/2 - \textheight/2 - 2in/2 - \topmargin - \headheight} % This is a work around for 
% the broken () in the calc package
% \setlength{\headsep}{(\paperheight - \textheight - 2in)/2 - \topmargin-\headheight}
\newlength{\uppermargin}
  \setlength{\uppermargin}{1in + \topmargin + \headheight + \headsep}
\setlength{\footskip}{0.35in}%\setlength{\footskip}{\paperheight - 0.25in - \textheight - \uppermargin}
%
\newlength{\uppermargintwo}
  \setlength{\uppermargintwo}{2in - \uppermargin - \baselineskip}
\newlength{\uppermarginfour}
  \setlength{\uppermarginfour}{4in - \uppermargin - \topskip - \baselineskip}
%%
\setlength{\parindent}{\@defaultparindent}
\setlength\parskip{0\p@ \@plus \p@}
%%%  Setup the lengths needed for the rule under the heading.
\newlength{\headwidth}\setlength{\headwidth}{\textwidth}
\newlength{\headrulewidth}\setlength{\headrulewidth}{0.4pt}
\newlength{\headruleskip}\setlength{\headruleskip}{1pt}
%%%
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@draftdate
  \def\ps@empty{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\parbox[t]{\headwidth}%
                      {\hfil{\slshape\leftmark}%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \def\@oddhead{\parbox[t]{\headwidth}%
                      {{\slshape\rightmark}\hfil%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \let\@mkboth\@gobbletwo
    \markboth{Draft Date: \today}{Draft Date: \today}
    }
  \def\ps@plain{%
    \def\@oddfoot{\hfil\thepage\hfil}
    \def\@evenfoot{\hfil\thepage\hfil}
    \def\@evenhead{\parbox[t]{\headwidth}%
                      {\hfil{\slshape\leftmark}%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \def\@oddhead{\parbox[t]{\headwidth}%
                      {{\slshape\rightmark}\hfil%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \let\@mkboth\@gobbletwo
    \markboth{Draft Date: \today}{Draft Date: \today}
    }
  \def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\parbox[t]{\headwidth}%
                      {\thepage\hfill{\slshape\leftmark}%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \def\@oddhead{\parbox[t]{\headwidth}%
                      {{\slshape\rightmark}\hfill\thepage%
                       \vskip\headruleskip%
                       \hrule\@height\headrulewidth\@width\headwidth}}
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    \markboth{Draft Date: \today}{Draft Date: \today}
    }
\else \if@twoside
\setlength{\oddsidemargin}{0.5in} % this seems correct -nbp
\setlength{\evensidemargin}{0.in} % this seems correct -nbp
  \def\ps@headings{
      \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage} %this works!
    \def\@oddhead{\hfil\thepage}
    \def\sectionmark##1{
      \markright{\MakeTextUppercase{
        \ifnum \c@secnumdepth >\z@
          \thesection. \ 
        \fi
        ##1}}}}
\else
  \def\ps@headings{
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    \markright{}
    }

\fi  % End the \if@twoside statements
\fi  % End the \if@draftdate statements
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Generate biographical information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\hometown#1{\gdef\@hometown{#1}} %nbp
\def\@hometown{\@latex@warning@no@line{No \noexpand\hometown given}} %nbp
\def\prevdeg#1{\gdef\@prevdeg{#1}} %nbp
\def\@prevdeg{\@latex@warning@no@line{No \noexpand\prevdeg given}} %nbp
\def\graduationmonth#1{\gdef\@graduationmonth{#1}} %nbp
\def\@graduationmonth{\@latex@warning@no@line{No \noexpand\graduationmonth given}} %nbp
\def\copyyear#1{\gdef\@copyyear{#1}} %nbp
\def\@copyyear{\@latex@warning@no@line{No \noexpand\copyyear given}} %nbp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Generate the list of committee members
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\cmtyA#1{\gdef\@cmtyA{#1}}
\def\@cmtyA{\@latex@warning@no@line{No \noexpand\cmtyA given}}
\def\cmtyB#1{\gdef\@cmtyB{#1}}
\def\@cmtyB{\@latex@warning@no@line{No \noexpand\cmtyB given}}
\def\cmtyC#1{\gdef\@cmtyC{#1}}
\def\@cmtyC{\@latex@warning@no@line{No \noexpand\cmtyC given}}
\def\cmtyD#1{\gdef\@cmtyD{#1}}
\def\@cmtyD{\@latex@warning@no@line{No \noexpand\cmtyD given}}
\def\cmtyE#1{\gdef\@cmtyE{#1}}
\def\@cmtyE{\@latex@warning@no@line{No \noexpand\cmtyE given}}
%\def\cmtyF#1{\gdef\@cmtyF{#1}}
%\def\@cmtyF{\@latex@warning@no@line{No \noexpand\cmtyF given}}
%\def\instF#1{\gdef\@instE{#1}}
%\def\@instF{\@latex@warning@no@line{No \noexpand\instE given}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\signrule{\vrule width7cm height -7.5pt depth 8pt}
\def\monthyear{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or July\or
    August\or September\or October\or November\or December\fi
    \space\number\year}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the UMI abstract environment  (which is no longer required)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{umiabstract}{%
  \newpage% Start a New page
  \thispagestyle{empty}
  \ifnum\@ptsize=0 \renewcommand{\baselinestretch}{1.67} \fi 
  \ifnum\@ptsize=1 \renewcommand{\baselinestretch}{1.62} \fi 
  \ifnum\@ptsize=2 \renewcommand{\baselinestretch}{1.66} \fi 
  %%%
  \begin{spacing}{1.0}
    \centering
%       {\@title}%
    {\MakeTextUppercase{\@title}\ifthenelse{\equal{\@thesissubtitle}{}}{}{\\
     \vspace{\baselineskip}
     {\@thesissubtitle}}}
    \vspace{\baselineskip}
  \end{spacing}

  \centerline{ABSTRACT PAGE}
}
{
  \vfill
  \centerline{\MakeTextUppercase{\@author}}
  \centerline{DEPARTMENT OF PHYSICS}
  % NOTE: change here if your main advisor is not a physics dept.'s
% professor:
  %\centerline{PROFESSOR OF APPLIED SCIENCE}%
  \centerline{THE COLLEGE OF WILLIAM AND MARY IN VIRGINIA}
  \centerline{\MakeTextUppercase{\@cmtyA}}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the title page command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@titlepage
\newcommand\maketitle[1][\the\year]{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \vspace*{0.2in}
  \begin{spacing}{1.0} %nbp added
  \begin{center}%
\ifnum\@ptsize=0   %if 10 poing
        {\fontsize{12}{14}\selectfont{\@title}}\\
        {\fontsize{12}{14}\selectfont{\@thesissubtitle}}\\
\else
%%title not captialized TSH
    %{\fontsize{13.75}{15}\selectfont{\@title}}\\
    %{\large {\@thesissubtitle}}%
    {\fontsize{12}{14}\selectfont{\@title}}\\ % All Title page fonts 12pt DJA
    {\fontsize{12}{14}\selectfont{\@thesissubtitle}}%  "  DJA
\fi
  \end{center}
  \end{spacing} % nbp added
%    \vfill
  \vskip 1.4083in   %BCR
  \centerline{\@author}
  \centerline{\@hometown}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Added this section to account for previous degrees, list most %%%%%%%
%%%%%%%%%% recent first...   				                 %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\vskip .5868in  %BCR

\begin{center}
  \singlespacing
  \@prevdeg
\end{center}
% Grad studies doesn't like separator lines.  
% \centerline{\rule{3.5in}{0.4\p@}}
%    \vskip 0.5in

    \vskip .4in %BCR

   \singlespacing
    \centerline{A Dissertation presented to the Graduate Faculty}
    \centerline{of The College of William \& Mary in Candidacy for the Degree of}
    \centerline{Doctor of Philosophy}
%    \vskip 0.5in 
 %   \vskip 0.5in 

     \vskip 1.0035in  %BCR

%    \centerline{\rule{3.5in}{0.4\p@}}
%    \vfill 
    \centerline{Department of Physics}
        \vskip 1.00in   %BCR
 %       \vskip 1in
    \centerline{College of William \& Mary}
	\centerline{\@graduationmonth}
%%%
%%%copyright page
%\newpage
%\thispagestyle{empty}
%%\vspace*{0.88\textheight}
%\vspace*{0.88\textheight}
%\begin{center}
%\flushbottom
%\copyright \@copyyear \\
%\vskip 0.02in
%\@author \\
%\vskip 0.02in
%All Rights Reserved.
\newpage
\thispagestyle{empty}
%\vspace*{0.88\textheight}
\vspace*{0.88\textheight}
\begin{center}
\flushbottom
\copyright~Copyright by \@author~\@copyyear \\
\vskip 0.02in
%\@author \\
\vskip 0.02in
%This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
%All Rights Reserved.
\end{center}
%%%%%%%
\end{titlepage}
  
  %% End Title Page Section %%%%%%%%%%%%%%%%
  
  
  
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{
  \newpage
  \null
  \vskip 2em
  \begin{center}
  \let \footnote \thanks
    {\LARGE \@title \par}
    \vskip 1.5em
    {\large
      \lineskip .5em
      \begin{tabular}[t]{c}
        \@author
      \end{tabular}\par}
    \vskip 1em%
    {\large \@date}
  \end{center}
  \par
  \vskip 1.5em}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the approval page command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makeapproval[1][{Approved, \monthyear}] {
    \thispagestyle{empty}
    \centerline{\large APPROVAL PAGE} %nbp
    \vskip 0.70in %\baselineskip  %nbp
    \begin{spacing}{1.}
    \centerline{This Dissertation is submitted in partial fulfillment of}
    \centerline{the requirements for the degree of}
    \end{spacing}
   \vskip 0.23in
    \centerline{Doctor of Philosophy}
    \vskip 0.15in
    \centerline{\signrule} \vskip -2ex  \centerline{\footnotesize \@author}
    \vskip 0.375in%\vfill
%   This is correct: NO left extra margin is allowed for the phrase word
%   "Approved..". Isn't that silly??? :-P
%    \centerline{\large{#1}}
    \centerline{#1}
    \vskip 0.1in 
    \centerline{\signrule} \vskip -2ex%+0.5ex  
    \centerline{\footnotesize Committee Chair}
    \vskip -0.2in %this was -0.1in before -nbp
    \centerline{\footnotesize \@cmtyA} 
     \vskip -0.2in %this was -0.1in before -nbp
     \centerline{\footnotesize College of William \& Mary}
%
    \vskip 0.in 
    \centerline{\signrule} \vskip -2ex  \centerline{\footnotesize \@cmtyB}
    \vskip 0.2in
    \centerline{\signrule} \vskip -2ex  \centerline{\footnotesize \@cmtyC}
    \vskip 0.2in
    \centerline{\signrule} \vskip -2ex  \centerline{\footnotesize \@cmtyD}
    \vskip 0.2in
    \centerline{\signrule} \vskip -2ex  \centerline{\footnotesize \@cmtyE}
    \vskip 0.2in
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the half-title page command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makehalftitle{\begin{titlepage}
                          \vspace*{\uppermarginfour}
                          \center\MakeTextUppercase{\@title}
                          \end{titlepage}}
%
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart         {\@Roman\c@part}
\renewcommand\thechapter      {\@arabic\c@chapter}
\renewcommand\thesection      {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\frontmatter{\cleardoublepage
            \@mainmatterfalse\pagestyle{plain}\pagenumbering{roman}}
\newcommand\mainmatter{\cleardoublepage
       \@mainmattertrue\pagestyle{headings}\pagenumbering{arabic}
       \@firstmaintrue \addcontentsline{toc}{chapter}
{\protect\hb@xt@\hsize{\@chapapp\hfill}}
       \@firstmainfalse}
\newcommand\backmatter{\if@openright\cleardoublepage\else\clearpage\fi
                       \@mainmatterfalse}
                       
                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the `part' command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\part{\cleardoublepage
                 \thispagestyle{plain}
                 \if@twocolumn
                     \onecolumn
                     \@tempswatrue
                   \else
                     \@tempswafalse
                 \fi
                 \null\vfil
                 \secdef\@part\@spart}

\def\@part[#1]#2{
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
    \else
      \addcontentsline{toc}{part}{#1}
    \fi
    \markboth{}{}
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}
    \@endpart}
\def\@spart#1{
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
                \null
                \thispagestyle{empty}
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}
              
              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the `chapter' command
%%%
%%%  If the command is used as "\chapter{...}" or "\chapter[...]{...}",
%%%  then it is executed by the "\@chapter" command given below, which
%%%  uses the "\@makechapterhead" command to create the heading.
%%%
%%%  If the command is used as "\chapter*{...}", then it is executed by the
%%%  "\@schapter" command given below, which uses the "\@makeschapterhead"
%%%  command to create the heading.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \global\@topnum\z@
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                        \thispagestyle{headings}
                         \if@appmatter %% What does this do?
                           \refstepcounter{chapter}
                           \typeout{\@chapapp\space\thechapter.}
                           \addcontentsline{toc}{chapter}
                           {\protect\hb@xt@\hsize{\@chapapp\space\thechapter\hfill} #1}% This applies to the Appendices
                         \else
                           \refstepcounter{chapter}
                           \typeout{\@chapapp\space\thechapter.}
                           \addcontentsline{toc}{chapter}
                                   {\protect\hskip 1.5em \numberline{\thechapter}#1}% This applies to Normal Chapters
                         \fi
                       \else
                         \addcontentsline{toc}{chapter}{#1}% This applies to the abstract
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}
                    \fi
                    \chaptermark{#1}
                    \addtocontents{lof}{\protect\addvspace{2.0\baselineskip}}
                    \addtocontents{lot}{\protect\addvspace{2.0\baselineskip}}
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]
                    \else
                      \@makechapterhead{#2}
                      \@afterheading
                      \parindent=\@defaultparindent
                      \rightskip=\@defaultrightskip
                    \fi}
\def\@makechapterhead#1{
  \vspace*{60\p@}%
  {\parindent \z@ \raggedright
   \normalfont
   \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
%%% This creates a Normal large chapter heading
%% nbp: i added the following lines to change chapter size with 10pt font
\ifnum\@ptsize=0   %0 is for 10 pt
\LARGE
\else \huge
\fi
%
      \bfseries \@chapapp\space \thechapter
      \par\nobreak
      \vskip 20\p@
%%% This creates a small centered chapter heading
      \else
        \vspace*{-\topskip}%
      \fi
    \else
      \vspace*{-\topskip}%
    \fi
    \interlinepenalty\@M
%%% This produces a large chapter heading (left aligned)
%% nbp: i added the following lines to change chapter size with 10pt font
\ifnum\@ptsize=0 
\LARGE
\else \Huge
\fi
%
    \bfseries #1\par\nobreak
    \vskip 40\p@
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \vskip 4\p@
      \else
        \vskip 40\p@
      \fi
    \else
      \vskip 40\p@
    \fi
    \parindent=\@defaultparindent
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]
                 \else
                   \@makeschapterhead{#1}
                   \@afterheading
                   \parindent=\@defaultparindent
                   \rightskip=\@defaultrightskip
                 \fi}
\def\@makeschapterhead#1{
  \vspace*{\uppermargintwo}
  \vspace*{-\topskip}
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \begin{center}\bfseries #1\end{center}\par\nobreak
    \vskip 40\p@
    \parindent=\@defaultparindent
  }}
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the `section', `subsection', `subsubsection', `paragraph',
%%%  and `subparagraph' commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\section{\@startsection {section}{1}{\z@}
                                   {-3.5ex \@plus -1ex \@minus -.2ex}
                                   {2.3ex \@plus.2ex}
%% nbp: i added the following lines to change chapter size with 10pt font
		{\normalfont
			\ifnum\@ptsize=0 
				\large
			\else
				\Large
			\fi
		\bfseries}}  %needed for 10pt option
\newcommand\subsection{\@startsection{subsection}{2}{\z@}
                                     {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {1.5ex \@plus .2ex}
		{\normalfont
			\ifnum\@ptsize=0 
				\normalsize
			\else
				\large
			\fi
		\bfseries}}  %needed for 10pt option
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
                                     {-3.25ex\@plus -1ex \@minus -.2ex}
                                     {1.5ex \@plus .2ex}
                                     {\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}
                                    {3.25ex \@plus1ex \@minus.2ex}
                                    {-1em}
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}
                                       {3.25ex \@plus1ex \@minus .2ex}
                                       {-1em}
                                      {\normalfont\normalsize\bfseries}}
                                      
                                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the abstract environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thesisabstracthead}{\abstractname}
\newcommand{\thesisabstracttypesize}{\Large}
\newcommand{\@thesisabstracthead}{\thesisabstracthead}
\newenvironment{abstract}{
     \if@openright\cleardoublepage\else\clearpage\fi
     % Grad studies doesn't want the abstract in the TOC
     % because it's not supposed to have a page number. BOOOO
     % Add the abstract entry to the TOC
     %\addcontentsline{toc}{chapter}{\@thesisabstracthead}
     %% I used \normalfont and \large to unbold titles and increase fontsize, TSH
     \chapter*{\MakeTextUppercase{\normalfont\large\@thesisabstracthead}}
     \@mkboth{\MakeTextUppercase{\@thesisabstracthead}}
             {\MakeTextUppercase{\@thesisabstracthead}}
% Format the Heading for the Abstract
%        \vspace*{60\p@}%
%        \parindent \z@ \raggedright
%        \normalfont
%        \ifnum \c@secnumdepth >\m@ne
%        \if@mainmatter
        %%% This creates a Normal large chapter heading
%           \huge\bfseries \@chapapp\space \thechapter%
%           \huge\bfseries \abstractname%
%           \par\nobreak%
%           \vskip 20\p@%
			%% \vspace or \vskip added to put about 1 line in between titles and body for prelim pages, TSH.
           \vspace{-1.3cm}%
%    \interlinepenalty\@M
%    \Huge \bfseries \abstractname \par\nobreak
%    \vskip 40\p@
%        \@afterheading
%        \parindent=\@defaultparindent
%        \rightskip=\@defaultrightskip
%%%%
%        \chapter{ABSTRACT}%
%        \parindent=\@defaultparindent \rightskip=\@defaultrightskip%
        \normalfont\normalsize
        \begin{spacing}{1.1}}
%        \begin{spacing}{2.0}}
        {\end{spacing}\if@openright\cleardoublepage\else\clearpage\fi}
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup a bunch of basic environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {1.3em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {1.8em}
\setlength\leftmarginiii {1.7em}
\setlength\leftmarginiv  {1.5em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}
                \item\relax}
               {\endlist}
               
               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the titlepage environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@compatibility
\newenvironment{titlepage}
    {
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}
      \setcounter{page}\z@
    }
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}
      \setcounter{page}\@ne
    }
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the `appendix' command
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\appendix{\par
  \@appmattertrue
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \renewcommand\@chapapp{\appendixname}
  \renewcommand\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\thechapter.\@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand\thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand\thetable{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
% Length for use with captions
\newlength\captionwidth
%
% This version of the caption definition
% places 5 percent white space around the
% caption on each side of the text.
%
\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \renewcommand{\baselinestretch}{1.0}
  \sbox\@tempboxa{#1: #2}
  \footnotesize
  \setlength\captionwidth{\hsize*9/10}
  \ifdim \wd\@tempboxa >\captionwidth
  \hb@xt@\hsize{\hfill \parbox{\hsize*9/10}{#1: #2}\hfill}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\long\def\undertext#1{\hbox to\hsize{\hfill\vtop{\hbox{#1}\kern 1pt \hrule}\hfill}}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the table of contents type commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}
\newcommand\tableofcontents{
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\normalfont\large\MakeTextUppercase\contentsname
        \@mkboth{      \MakeTextUppercase\contentsname}{\MakeTextUppercase\contentsname}}
   \vspace{ -1.3cm} %%one line between title and body, TSH
%    {\flushright Page\endflushright\vskip -0.25cm}           %Remove "Page" in table of contents BCR
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@part[2]{
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}
    \addvspace{2.25em \@plus\p@}
    \begingroup
      \setlength\@tempdima{3em}
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
    \endgroup
    \parindent=\@defaultparindent \rightskip=\@defaultrightskip
  \fi}
\newcommand*\l@chapter[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}
    \renewcommand{\baselinestretch}{1.0} \small \normalsize
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
%% Graduate studies doesn't want anything bold in TOC.  Use \bfseries here to bold chapters. TSH
      \leavevmode %\bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {#1}\nobreak\leaders\hbox{$\m@th
       \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
       mu$}\hfill \nobreak
      \hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
    \renewcommand{\baselinestretch}{\@defaultbaselinestretch} \small \normalsize
    \parindent=\@defaultparindent \rightskip=\@defaultrightskip
  \fi}
\newcommand*\l@section{\@dottedtocline{1}{3.0em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{5.3em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{8.5em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{11.5em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{13.5em}{6em}}
\newcommand\listoffigures{%
    \newpage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\normalfont\large\MakeTextUppercase{\listfigurename}}
    \@mkboth{\MakeTextUppercase{\listfigurename}}
            {\MakeTextUppercase{\listfigurename}}
    \begin{spacing}{1.1}
     %\vspace{ -1.3cm} %one line, TSH
     \vspace{ -2.6cm} %two lines
%   FIXME:
%   The "Figure   Page" text below is a hack, so that it appears on
%   top of the content table. It's not very nice, and the spacing to
%   the rest of the table is still too big.
%      {\flushright Figure\hspace{12.45cm}Page\endflushright\addvspace{-2.0\baselineskip }} % Remove "Page" and "Figure" BCR
      \@starttoc{lof}
    \end{spacing}
    \if@restonecol\twocolumn\fi
    \renewcommand{\baselinestretch}{\@defaultbaselinestretch} \small\normalsize
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{
    \newpage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\normalfont\large\MakeTextUppercase{\listtablename}}
    \@mkboth{\MakeTextUppercase{\listtablename}}
            {\MakeTextUppercase{\listtablename}}
    \begin{spacing}{1.1}
    %\vspace{ -1.3cm} %one line TSH
    \vspace{ -2.6cm} %two lines
%   FIXME:
%   The "Figure   Page" text below is a hack, so that it appears on
%   top of the content table. It's not very nice, and the spacing to
%   the rest of the table is still too big.
 %     {\flushright Table\hspace{12.60cm}Page\endflushright\addvspace{-2.0\baselineskip }} % Remove "Page" and "Table" BCR
      \@starttoc{lot}%
    \end{spacing}
    \if@restonecol\twocolumn\fi
    \renewcommand{\baselinestretch}{\@defaultbaselinestretch} \small\normalsize
    }
\let\l@table\l@figure


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the bibliography commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\addcontentsline{toc}{chapter}{\normalfont\large\bibname}
      \chapter*{\MakeTextUppercase{\bibname}}
      \typeout{\MakeTextUppercase{\normalfont\large\bibname}}
      \@mkboth{\MakeTextUppercase{\bibname}}
              {\MakeTextUppercase{\bibname}}

      \renewcommand{\baselinestretch}{1.0}\small\normalsize
      
      \list{\@biblabel{\@arabic\c@enumiv}}
           {\setlength{\itemsep}{2ex  \@plus .2ex \@minus 0ex}
            \settowidth\labelwidth{\@biblabel{#1}}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the index commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]
                \@mkboth{\MakeTextUppercase\indexname}
                        {\MakeTextUppercase\indexname}
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{
    \parindent 1em
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Setup the sectioning names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\contentsname{Table of Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\acknowledgementname{Acknowledgements}
\newcommand\abstractname{Abstract}
% Unfortunately BIBLIOGRAPHY must be all-uppercase; we just use simple fix
% for the TOC entry (must be put in the main document)
% This is because I use natbib package. Perhaps you can do better without
% natbib package.
\newcommand\bibname{\normalfont\large BIBLIOGRAPHY}
\newcommand\vitaname{Vita}
\newcommand\indexname{INDEX}
\newcommand\figurename{FIG.}
\newcommand\tablename{TABLE}
\newcommand\partname{Part}
\newcommand\chaptername{CHAPTER}
\newcommand\appendixname{APPENDIX}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Define `today`
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\def\enumerate{
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}
  \fi}
\def\itemize{
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}}
  \fi}
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@
     \@tempskipa -\@tempskipa 
   \fi
   \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa
   \fi
   \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}
     {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}
  \addtocontents{\csname ext@#1\endcsname}{\protect\addvspace{2ex}}
  \begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\long\def\@footnotetext#1{\insert\footins{
    \reset@font\renewcommand{\baselinestretch}{1.0}\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{
       \csname p@footnote\endcsname\@thefnmark
    }
    \color@begingroup
      \@makefntext{
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}}
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  More definition of committee menbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\cmty1#1{\gdef\@cmty1{#1}}
\def\@cmty1{\@latex@warning@no@line{No \noexpand\cmty1 given}}
\def\cmty2#1{\gdef\@cmty2{#1}}
\def\@cmty2{\@latex@warning@no@line{No \noexpand\cmty2 given}}
\def\cmty3#1{\gdef\@cmty3{#1}}
\def\@cmty3{\@latex@warning@no@line{No \noexpand\cmty3 given}}
\def\cmty4#1{\gdef\@cmty4{#1}}
\def\@cmty4{\@latex@warning@no@line{No \noexpand\cmty4 given}}
\def\addcontentsline#1#2#3{%
  \if@firstmain
    \addtocontents{#1}{\protect\contentsline{#2}{#3}{}}
  \else
    \addtocontents{#1}{\protect\contentsline{#2}{#3}{\thepage}}
  \fi
}
\def\@centeredhangfrom#1{
      \noindent\hbox{#1}\parfillskip=\z@\parindent=\z@\leftskip=0pt plus 1fil
      \rightskip=\leftskip }
\long\def\underlefttext#1{\hbox to\hsize{\vtop{\hbox{#1}\kern 1pt \hrule}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This redefines the Section heading environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%% Commands for spacing.  Some parts from spacing.sty by Stephen Page.
%%% 
\ifx\undefined\selectfont
\def\@setsize#1#2#3#4{\@nomath#1
   \let\@currsize#1\baselineskip
   #2\baselineskip\baselinestretch\baselineskip
   \parskip\baselinestretch\parskip
   \setbox\strutbox\hbox{\vrule height.7\baselineskip
      depth.3\baselineskip width\z@}
   \normalbaselineskip\baselineskip#3#4}
\else
\def\@newbaseline{%
    \ifx\undefined\setnew@baselineskip
      \baselineskip\f@baselineskip\relax
    \else
      \setnew@baselineskip
    \fi
    \baselineskip\baselinestretch\baselineskip
    \setbox\strutbox\hbox{\vrule\@height.7\baselineskip
    \@depth.3\baselineskip \@width\z@}
    \normalbaselineskip\baselineskip}
\fi
%%%
%%% Reset baselinestretch within footnotes and floats. Originally stolen
%%% from Stanford thesis style.
%%%
%%% <wirawan0> As of December 2004, this is not the best subroutine
%%% available out there. Compared to the \@xfloat command in latex.ltx,
%%% this sequence is far too simple!
%%%
\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
       \@tfor \@tempa :=#2\do
                        {\if\@tempa h\advance\@tempcnta \@ne\fi
                         \if\@tempa t\advance\@tempcnta \tw@\fi
                         \if\@tempa b\advance\@tempcnta 4\relax\fi
                         \if\@tempa p\advance\@tempcnta 8\relax\fi
         }\global\count\@currbox\@tempcnta}\@fltovf\fi
    \global\setbox\@currbox
    \color@vbox
    \normalcolor
    \vbox\bgroup
    \def\baselinestretch{1}
    \ifx\undefined\selectfont
    \small\normalsize
    \else
    \@newbaseline
    \fi
    \boxmaxdepth\z@
    \hsize\columnwidth \@parboxrestore}
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}
%%% Set up the Vita Environment
\newcommand{\thesisvitahead}{\vitaname}
\newcommand{\thesisvitaheadtypesize}{\Large}
\newcommand{\@thesisvitahead}{\thesisvitahead}
\def\vitaauthor#1{\gdef\@vitaauthor{#1}}
\global\let\@vitaauthor\@empty
%%%
%%% Environment to generate vita page.
%%%
\newenvironment{thesisauthorvita}
    {\clearpage
     \addcontentsline{toc}{chapter}{\@thesisvitahead}
     \chapter*{\normalfont\large\MakeTextUppercase{\@thesisvitahead}}
     \@mkboth{\MakeTextUppercase{\@thesisvitahead}}
             {\MakeTextUppercase{\@thesisvitahead}}
             \vskip -1.3cm
    \begin{spacing}{\@defaultbaselinestretch}
      \ifx\@vitaauthor\@empty
      \centerline{\underline{\@author}}
      \else
      \centerline{\underline{\@vitaauthor}}
      \fi
    \addvspace{1.0\baselineskip}}
    {\end{spacing}}
%%%
%%% Environment to generate acknoledgements page.
%%%
\newcommand{\thesisacknowledgementshead}{\acknowledgementname}
\newcommand{\thesisacknowledgementstypesize}{\Large}
\newcommand{\@thesisacknowledgementshead}{\thesisacknowledgementshead}
\newenvironment{acknowledgements}
    {\clearpage
     \chapter*{\@thesisacknowledgementshead
         \@mkboth{\uppercase{\@thesisacknowledgementshead}}
                 {\uppercase{\@thesisacknowledgementshead}}}
    \addcontentsline{toc}{chapter}{\@thesisacknowledgementshead}
    \begin{spacing}{1.1}
}
    {\end{spacing}}
%%%
%%% Stolen from MIT.
%%%
\def\spacing#1{\par
 \begingroup
 \def\baselinestretch{#1}
 \ifx\undefined\selectfont
 \ifx\@currsize\normalsize\@normalsize\else\@currsize\fi
 \else
 \@newbaseline
 \fi}
\def\endspacing{\par
 \vskip \parskip
 \vskip \baselineskip
 \endgroup
 \vskip -\parskip
 \vskip -\baselineskip}
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Additional macros (wirawan0)
%
% We provide \subtitle to give the thesis a subtitle
% By default it is empty
\def\subtitle#1{\gdef\@thesissubtitle{#1}}
\gdef\@thesissubtitle{}
%
\endinput
%
% Automatically include the following packages since they are needed by
% the commands above (do not include them in the main thesis file!)
% This is stupid! It can't be included above, don't know why!
%
% Use the `setspace' package for adjusting spacing. We do NOT use the
% old `doublespace' package---since it's too old and incompatible with
% the `color' package!
\usepackage{setspace}
%\usepackage{hyperref}
%%%
%
%%
%% End of file `wmthesis.cls'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
