\ProvidesClass{markusos-letter}[2014/01/25 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Colors

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\colorlet{fillheader}{white}
\colorlet{header}{gray}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

% Fonts

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{Helvetica Neue}
\newfontfamily\thinfont[]{HelveticaNeueLTPro-UltLt}
\newfontfamily\headingfont[]{HelveticaNeueLTPro-BdCn}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{HelveticaNeueLTPro-Lt}

% Header

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{5.3cm}
  \vspace{-2\parskip}
}


% Structure

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

% List environment

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[2]{%
  \parbox[t]{15cm}{%
		#1\\%
		#2
		\vspace{\parsep}%
  }}

% Side block

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside_right}{%
  \let\oldsection\section

  \begin{textblock}{5}(13.3, 4)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newenvironment{aside_left}{%
  \let\oldsection\section

  \begin{textblock}{5}(3.3, 4)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

% Other

\RequirePackage[left=3.3cm,top=2cm,right=3.5cm,bottom=2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}