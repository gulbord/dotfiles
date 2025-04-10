\NeedsTeXFormat{LaTeX2e}[2021/06/01]
\ProvidesClass{gulbook-sans}[2021/06/01 v1.0 LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@mainmatter\@mainmattertrue

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}

\@twosidetrue\@mparswitchtrue
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
\ExecuteOptions{11pt}
\ProcessOptions
\input{gul1\@ptsize.clo}

\setlength\lineskip{\z@}
\setlength\normallineskip{\z@}
\lineskiplimit=\z@
\renewcommand\baselinestretch{}
\setlength\parskip{\z@}
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

\def\ps@headings{%
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\rlap\thepage\hfil{\itshape\leftmark}
		\hfil\llap{\S\thesection}}%
	\def\@oddhead{\rlap{\S\thesection}\hfil{\itshape\rightmark}
		\hfil\llap\thepage}%
	\let\@mkboth\markboth
	\def\chaptermark##1{\markboth{##1}{##1}}%
	\def\sectionmark##1{\markright{##1}}}

% get parindent as in normal text
\newlength\normalparindent
\setlength\normalparindent{\the\dimexpr 1.2em\relax}

\newcommand\maketitle{\par
	\begingroup
	\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
	\def\@makefnmark{%
		\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
	\long\def\@makefntext##1{\hangindent\normalparindent\noindent
		\hb@xt@\normalparindent{\normalfont\@thefnmark.\hss}##1}%
	\newpage
	\global\@topnum\z@   % Prevents figures from going at top of page.
	\@maketitle
	\thispagestyle{empty}\@thanks
	\endgroup
    \clearpage{\thispagestyle{empty}\cleardoublepage}
	\setcounter{footnote}{0}%
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

\def\@maketitle{%
	\newpage
	\null
	\vskip 2\baselineskip%
	\begin{center}%
		\let\footnote\thanks
		{\LARGE{\sffamily\bfseries\@title}\par}%
		\vskip 1\baselineskip%
		{\large
			\lineskip 5\p@%
			\begin{tabular}[t]{c}%
				\@author
			\end{tabular}\par}%
		\vskip 1\baselineskip%
		{\large\@date}%
	\end{center}%
	\par
	\vskip 1\baselineskip}

\newcommand*\chaptermark[1]{\markboth{#1}{#1}}
\setcounter{secnumdepth}{2}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\renewcommand\thechapter{\@arabic\c@chapter}
\renewcommand\thesection{\thechapter.\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\enskip}

\newcommand\frontmatter{%
    \cleardoublepage
	\@mainmatterfalse
	\pagenumbering{roman}}
\newcommand\mainmatter{%
	\clearpage{\thispagestyle{empty}\cleardoublepage}
	\@mainmattertrue
	\pagenumbering{arabic}}
\newcommand\backmatter{%
    \clearpage{\thispagestyle{empty}\cleardoublepage}
	\@mainmatterfalse}

\newcommand\chapter{\clearpage
	\clearpage\thispagestyle{empty}\cleardoublepage
    \thispagestyle{empty}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
	\ifnum\c@secnumdepth >\m@ne
	\if@mainmatter
	\refstepcounter{chapter}%
	\typeout{\thechapter.}%
	\addcontentsline{toc}{chapter}%
	{\protect\numberline{\thechapter}#1}%
	\else
	\addcontentsline{toc}{chapter}{#1}%
	\fi
	\else
	\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	\@makechapterhead{#2}%
	\@afterheading}

\newlength\@bskp
\setlength\@bskp{1\baselineskip}

\def\@makechapterhead#1{%
	{\null
	\vskip -\topskip
	{\raggedbottom\raggedright
		\lineskip\z@\parindent\z@
		\sffamily\bfseries
		\vskip -\@bskp
		\textcolor{black}{\rule{\textwidth}{1pt}}\par\nobreak
		\colorbox{black}{%
			\parbox[c][3.25\@bskp]{3.25\@bskp}{\hfil\color{white}%
                \fontsize{2.75\@bskp}{0pt}\selectfont\thechapter\hfil}}
		\hspace{1em}\LARGE#1\par\nobreak
		\vskip 2.75\@bskp plus 4pt minus 4pt}}}

\def\@schapter#1{%
	\@makeschapterhead{#1}%
	\@afterheading}

\def\@makeschapterhead#1{%
	{\null
	\vskip -\topskip
	{\raggedbottom\raggedright
		\lineskip\z@\parindent\z@
		\sffamily\bfseries
		\vskip -\@bskp
		\textcolor{black}{\rule{\textwidth}{1pt}}\par\nobreak
		\colorbox{black}{%
		%	\parbox[c][3.25\@bskp]{3.25\@bskp}{\noindent\hfil\color{white}\HUGE$\star$\hfil}}
			\parbox[c][3.25\@bskp]{3.25\@bskp}{\HUGE\vphantom{1}}}
		\hspace{1em}\LARGE#1\par\nobreak
		\vskip 2.75\@bskp
        \vskip -1pt}}}

\ifnum\@ptsize=0
\newcommand\section{\@startsection{section}{1}{\z@}%
	{-16\p@ \@plus -4\p@ \@minus -2\p@}%
	{8\p@ \@plus 2\p@}%
	{\sffamily\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-8\p@ \@plus -2\p@ \@minus -2\p@}%
	{4\p@ \@plus 2\p@}%
	{\sffamily\bfseries}}
\else
\newcommand\section{\@startsection{section}{1}{\z@}%
	{-18\p@ \@plus -4\p@ \@minus -4\p@}%
	{10\p@ \@plus 4\p@ \@minus 3\p@}%
	{\medium\sffamily\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-9\p@ \@plus -3\p@ \@minus -3\p@}%
	{5\p@ \@plus 2\p@}%
	{\sffamily\bfseries}}
\fi

\setlength\leftmargini{2.4em}
\leftmargin\leftmargini
\setlength\leftmarginii{2em}
\setlength\leftmarginiii{1.6em}
\setlength\leftmarginiv{1.2em}
\setlength\leftmarginv{0.8em}
\setlength\leftmarginvi{0.8em}

\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty-\@lowpenalty
\@endparpenalty-\@lowpenalty
\@itempenalty-\@lowpenalty
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
\newcommand\labelitemi{\labelitemfont\textbullet}
\newcommand\labelitemii{\labelitemfont\bfseries\textendash}
\newcommand\labelitemiii{\labelitemfont\textasteriskcentered}
\newcommand\labelitemiv{\labelitemfont\textperiodcentered}
\newcommand\labelitemfont{\normalfont}
\newenvironment{description}
{\list{}{\labelwidth\z@ \itemindent-\leftmargin
		\let\makelabel\descriptionlabel}}
{\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont%
	\sffamily\bfseries #1}

\newenvironment{verse}
{\let\\\@centercr
	\list{}{\itemsep\z@
		\itemindent -1.2em%
		\listparindent\itemindent
		\rightmargin\leftmargin
		\advance\leftmargin 1.2em}%
	\item\relax}
{\endlist}
\newenvironment{quotation}
{\list{}{\listparindent 1.2em%
		\itemindent\listparindent
		\rightmargin\leftmargin
		\parsep\z@}%
	\item\relax}
{\endlist}
\newenvironment{quote}
{\list{}{\rightmargin\leftmargin}%
	\item\relax}
{\endlist}

\newcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\gdef\thechapter{\@Alph\c@chapter}}

\setlength\arraycolsep{5pt}
\setlength\tabcolsep{6pt}
\setlength\arrayrulewidth{.4pt}
\setlength\doublerulesep{2pt}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3pt}
\setlength\fboxrule{.4pt}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand\thefigure
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
	{\edef\@tempa{\noexpand\@float{figure}[\fps@figure]}
     \@tempa
     \small}
	{\end@float}
\newenvironment{figure*}
	{\edef\@tempa{\noexpand\@dblfloat{figure}[\fps@figure]}
     \@tempa
     \small}
	{\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
	{\edef\@tempa{\noexpand\@float{table}[\fps@figure]}
     \@tempa
     \small}
	{\end@float}
\newenvironment{table*}
	{\edef\@tempa{\noexpand\@dblfloat{table}[\fps@figure]}
     \@tempa
     \small}
	{\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\RequirePackage{booktabs}
\ifnum\@ptsize=0
\setlength\abovecaptionskip{8\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\abovetopsep{3\p@}
\else
\setlength\abovecaptionskip{9\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\abovetopsep{3\p@}
\fi
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{\small{\sffamily\bfseries #1:} #2}%
	\ifdim\wd\@tempboxa>\hsize
	{\small{\sffamily\bfseries #1:} #2\par}
	\else
	\global\@minipagefalse
	\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
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
\newcommand\@pnumwidth{1.2em}
\newcommand\@tocrmarg{2.4em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}

%\renewcommand{\numberline}[1]{\hb@xt@\@tempdima{#1\hfil}}

\newcommand\tableofcontents{%
	\chapter*{\contentsname
		\@mkboth{\contentsname}{\contentsname}}%
	\@starttoc{toc}}

\newcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip\medskipamount
        \setlength\@tempdima{1.2em}%
        \begingroup
            \parindent\z@ \rightskip\@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            \sffamily\bfseries #1
            \nobreak\hfil
            \nobreak\hb@xt@\@pnumwidth{\hss #2%
                                       \kern-\p@\kern\p@}\par
%            \nobreak\hspace\@tempdima#2\kern-\p@\kern\p@\par
            \penalty\@highpenalty
        \endgroup
	\fi}

\newcommand*\l@section{\@dottedtocline{1}{1.2em}{1.7em}}
\newcommand*\l@subsection{\@dottedtocline{2}{2.9em}{3.4em}}

%\newcommand*\l@section[2]{%
%    \ifnum \c@tocdepth >\z@
%        \addpenalty\@secpenalty
%        \setlength\@tempdima{1.7em}%
%        \begingroup
%            \parindent\z@ \rightskip\@pnumwidth
%            \parfillskip -\@pnumwidth
%            \leavevmode
%            \advance\leftskip\@tempdima
%            \hskip -0.5em
%            #1\nobreak\hspace{1.2em}#2\kern-\p@\kern\p@\par
%        \endgroup
%    \fi}
%
%\newcommand*\l@subsection[2]{%
%    \ifnum \c@tocdepth >\@ne
%        \addpenalty\@secpenalty
%        \setlength\@tempdima{2.2em}%
%        \begingroup
%            \parindent\z@ \rightskip\@pnumwidth
%            \parfillskip -\@pnumwidth
%            \leavevmode
%            \advance\leftskip3.4em
%            \hskip -0.5em
%            #1\nobreak\hspace{1.2em}#2\kern-\p@\kern\p@\par
%        \endgroup
%    \fi}

\newdimen\bibindent
\setlength\bibindent{1.2em}
\newenvironment{thebibliography}[1]{%
	\chapter*{\bibname}%
	\@mkboth{\bibname}{\bibname}%
	\list{\@biblabel{\@arabic\c@enumiv}}{%
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty\clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m%
}{%
	\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}

\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}{%
	\twocolumn[\@makeschapterhead{\indexname}]%
	\@mkboth{\indexname}{\indexname}%
	\thispagestyle{empty}
	\parindent\z@
	\columnseprule\z@
    \ifnum\@ptsize=0
        \columnsep=24\p@
    \else
	    \columnsep 28\p@
    \fi
	\let\item\@idxitem}{\onecolumn}

\newcommand\@idxitem{\par\hangindent2.4em}
\newcommand\subitem{\@idxitem\hspace*{1.2em}}
\newcommand\subsubitem{\@idxitem\hspace*{1.8em}}
\newcommand\indexspace{\par\vskip\medskipamount}
\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@}
\newcommand\@makefntext[1]{%
	\hangindent\normalparindent\noindent
	\hb@xt@\normalparindent{\normalfont\@thefnmark.\hss}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space\number\day, \number\year}
\ifnum\@ptsize=0
    \setlength\columnsep{18\p@}
\else
    \setlength\columnsep{21\p@}
\fi
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}

\if@twocolumn
\twocolumn
\flushbottom
\else
\onecolumn
\fi

\endinput
