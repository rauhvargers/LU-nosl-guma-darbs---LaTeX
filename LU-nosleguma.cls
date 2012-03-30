
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{LU-nosleguma} [2012/03/26 v1.0, Latvijas Universitāte]
\LoadClass[a4paper,12pt]{article}

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\studentid}[1]{\def \@studentid {#1}}
	\newcommand{\supervisor}[1]{\def \@supervisor {#1}}
	\newcommand{\thesistype}[1]{\def \@thesistype {#1}}
	\newcommand{\subject}[1]{\def \@subject {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}
	\newcommand{\email}[1]{\def \@email {#1}}
	\newcommand{\university}[1]{\def \@university {#1}}
	\newcommand{\faculty}[1]{\def \@faculty {#1}}
	\newcommand{\location}[1]{\def \@location {#1}}
	\supervisor{}
	\studentid{}
	\thesistype{}
	\subject{}
	\wordcount{}
	\email{}
	\university{}
	\faculty{}
	\location{}
\makeatother

% margins
\usepackage[top=20mm,bottom=20mm,left=30mm,right=20mm]{geometry}

\linespread{1.5}
% fonts

% XeLaTeX atbalsts tiek pieslēgts ar šādām pakotnēm:
\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra} %

% Valodu atbalsts
\usepackage{polyglossia}
\setdefaultlanguage{latvian}
\setotherlanguages{english,russian}

%salabo latviešu valodu - nodaļu nosaukumi, attēlu paraksti u.c.
\usepackage{fixlatvian}

% Fonti -- var rakstīt sistēmas fontu nosaukumus
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Arial}
\newfontfamily\russianfont{Times New Roman}
% alignment


% indentation
\usepackage{indentfirst}
\setlength{\parindent}{1cm}
\setlength{\parskip}{3pt}

\usepackage{sectsty}

\sectionfont{\Large\MakeUppercase}
\subsectionfont{\large}

% spacing
\usepackage{setspace}

%
\usepackage{tocloft}


% references
%\usepackage{varioref}

% attēli
\usepackage{graphicx}

%satura rādītājs
\usepackage{tocloft}
\renewcommand\cftsecfont{\normalfont}
\renewcommand\cftsecpagefont{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand\cftsecdotsep{\cftdot}
\renewcommand\cftsubsecdotsep{\cftdot}

%katrai nodaļai jābūt jaunā lapā.
\let\stdsection\section
\renewcommand\section{\newpage\stdsection}


% bibliography
%\usepackage{natbib}

% page headings and numbering
\makeatletter
	\usepackage{fancyhdr}
	\pagestyle{fancy}
	\renewcommand{\footrulewidth}{\headrulewidth}
	\fancyhf{}

	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}

	\fancyfoot[C]{\thepage}
\makeatother

% title
\makeatletter
\def \maketitle {%
	\begin{titlepage}
		
		\begin{center}
			%lapas augšā atsauce uz universitāti
			%@12pt Large ir ap 16punktiem
			{\Large\MakeUppercase\@university}\\
			{\Large\MakeUppercase \@faculty}
		\end{center}
		~\vfill
		\begin{center}
			%lielais dokumenta virsraksts
			%LARGE jābūt ap 18 punktiem
			\textbf{\LARGE\MakeUppercase \@title} \\
			\ifx \@thesistype \@empty
				\relax
			\else
				\vspace{0.5em}
				{\large\MakeUppercase \@thesistype} \\
			\fi
		\end{center}
		~\vfill

		%~pa labi no centra
		% ir kaste ar info par autoru un vadītāju
		\hspace*{0.4\linewidth}
		\begin{minipage}{0.6\linewidth}
			\begin{flushleft}
			\ifx @author \@empty
				\relax
			\else
				Autors: \textbf{\@author}\\
				\ifx \@studentid \@empty
					\relax
				\else
					Stud. apl. \@studentid \\
				\fi
			\fi
			\ifx \@supervisor \@empty
				\relax
			\else
				Darba vadītājs: \@supervisor \\
				\vspace{0.5in}
			\fi
			
			\end{flushleft}
			\end{minipage}

			~\vfill	

			\begin{center}
			\ifx \@location \@empty
				\relax
			\else
				{\Large\MakeUppercase \@location~\the\year}
			\fi
			
			\end{center}


	\end{titlepage}
}
\makeatother
