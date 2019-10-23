" Vim syntax file
" Language    : CLIPS, C Language Integrated Production System
" Maintainer  : Novikov Artem Gennadievich <novikovag@gmail.com>
" Last Change : 2009 Sep 7

if exists('b:current_syntax')
  finish
endif

set iskeyword=33-126,^34,^38,^40-41,^59,^60,^124,^126

syn match   clipsIOFormat         /%-\=\d*\.\=\d*[cdefgoxsnr%]/ contained
syn match   clipsTODO             /\c\(TODO\|TBD\|FIXME\|XXX\)/ contained

syn match   clipsComment          /;.*$/ contains=clipsTODO
syn match   clipsFloat            /\<[-+]\=\d\+\.\d*\(\ce[-+]\=\d\+\)\=\>/
syn match   clipsIdentifier       /\<$\=?[^<[:space:]"()$|~;&]*/
syn match   clipsInteger          /\<[-+]\=\d\+\>/
syn match   clipsMiscClasses      /\<?\(ALL\|DERIVE\|NONE\|VARIABLE\)\>/
syn match   clipsModuleSpecifier  /[^<[:space:]"()$|~;&]\+::[^<[:space:]"()$|~;&]\+/
syn match   clipsSpecial1         /</
syn match   clipsSpecial2         /\(<-\|=>\)/
syn match   clipsSpecial3         /\(|\|&\|\~\):\=/
syn region  clipsTextString       start=+"+ skip=+\\"+ end=+"+ contains=clipsIOFormat
syn match   clipsIOSpecial        /"\(a\|r\|r+\|wb\=\)"/
syn region  clipsRegion1          start="(" end=")" contains=ALL
syn region  clipsRegion2          matchgroup=clipsConditional start="(\s*\(if\|switch\)\>" matchgroup=clipsConditional end=")" contains=ALL
syn region  clipsRegion3          matchgroup=clipsConstruct start="(\s*def\(\class\|facts\|function\|generic\|fmethod\|global\|instances\|\message-handler\|module\|rule\|template\)\{1}" matchgroup=clipsConstruct end=")" contains=ALL
syn region  clipsRegion4          matchgroup=clipsRepeat start="(\s*\(\foreach\|loop-for-count\|while\)" matchgroup=clipsRepeat end=")" contains=ALL

syn keyword clipsAgenda           agenda
syn keyword clipsBoolean          TRUE FALSE
syn keyword clipsConditional      then else exists forall logical test
syn keyword clipsDebugging        dribble-off dribble-on list-watch-items unwatch watch
syn keyword clipsEnvironment      apropos batch* batchbload bsave clear constructs-to-c exit get-auto-float-dividend
syn keyword clipsEnvironment      get-dynamic-constraint-checking get-static-constraint-checking load load* options reset save
syn keyword clipsEnvironment      set-auto-float-dividend set-dynamic-constraint-checking set-static-constraint-checking system
syn keyword clipsFact             assert assert-string dependencies dependents duplicate fact-existp fact-index
syn keyword clipsFact             fact-relation facts fact-slot-names fact-slot-value get-deffacts-list get-fact-duplication
syn keyword clipsFact             get-fact-list list-deffacts load-facts modify ppdeffacts ppfact retract save-facts
syn keyword clipsFact             set-fact-duplication str-assert undeffacts
syn keyword clipsFocus            clear-focus-stack focus get-focus get-focus-stack list-focus-stack pop-focus
syn keyword clipsFunction         get-deffunction-list list-deffunctions ppdeffunction undeffunction
syn keyword clipsGeneric          call-next-method call-specific-method get-defgeneric-list get-defmethod-list
syn keyword clipsGeneric          get-method-restrictions list-defgenerics list-defmethods next-methodp override-next-method
syn keyword clipsGeneric          ppdefgeneric ppdefmethod preview-generic type undefgeneric undefmethod
syn keyword clipsGlobal           get-defglobal-list get-reset-globals list-defglobals ppdefglobal
syn keyword clipsGlobal           set-reset-globals show-defglobals shows-defglobals undefglobal
syn keyword clipsIO               close format get-char open printout read readline read-number remove rename set-locale
syn keyword clipsIOName           stdin stdout t wclips wdialog wdisplay werror wtrace wwarning
syn keyword clipsIOSpecial        crlf EOF ff tab vtab
syn keyword clipsLabel            case
syn keyword clipsMath             abs div float integer max min deg-grad deg-rad exp grad-deg log log10 mod pi
syn keyword clipsMath             rad-deg round sqrt acos acosh acot acoth acsc acsch asec asech asin asinh atan
syn keyword clipsMath             atanh cos cosh cot coth csc csch sec sech sin sinh tan tanh
syn keyword clipsMemory           conserve-mem mem-requests mem-used release-mem
syn keyword clipsMiscellaneous    funcall gensym gensym* get-function_restrictions get-function-restrictions help help-path
syn keyword clipsMiscellaneous    length random seed setgen sort time timer
syn keyword clipsModule           deffacts-module deffunction-module defgeneric-module defglobal-module defrule-module export
syn keyword clipsModule           get-current-module get-defmodule-list import list-defmodules ppdefmodule set-current-module
syn keyword clipsMultifield       create$ delete$ delete-member$ expand$ explode$ first$ implode$ insert$ length$ member member$
syn keyword clipsMultifield       mv-append mv-delete mv-replace mv-subseq nth nth$ replace$ replace-member$ rest$ str-explode
syn keyword clipsMultifield       str-implode subseq$ subset subsetp
syn keyword clipsPredicate        and eq evenp floatp integerp lexemep multifieldp neq not numberp oddp or pointerp
syn keyword clipsPredicate        sequencep stringp symbolp wordp
syn keyword clipsProcedural       bind break progn progn$ return
syn keyword clipsProfiling        get-profile-percent-threshold profile profile-info profile-reset set-profile-percent-thresholds
syn keyword clipsRule             declare get-defrule-list get-incremental-reset get-salience-evaluation list-defrules
syn keyword clipsRule             matches ppdefrule refresh remove-break rules set-break set-incremental-reset set-salience-evaluation
syn keyword clipsRule             show-breaks undefrule
syn keyword clipsRuleProperty     auto-focus salience
syn keyword clipsSequence         get-sequence-operator-recognition set-sequence-operator-recognition
syn keyword clipsSlotAttribute    allowed-floats allowed-instance-names allowed-integers allowed-lexemes allowed-numbers
syn keyword clipsSlotAttribute    allowed-strings allowed-symbols allowed-values cardinality default-dynamic range type
syn keyword clipsSlotDefinition   multislot slot
syn keyword clipsSpecial1         * + ** - / > >= = !=
syn keyword clipsSpecial4         nil default
syn keyword clipsString           build check-syntax eval lowcase str-cat str-compare str-index string-to-field str-length
syn keyword clipsString           sub-string sym-cat upcase
syn keyword clipsSystemClasses    ADDRESS EXTERNAL-ADDRESS FACT-ADDRESS FLOAT INITIAL-OBJECT INSTANCE INSTANCE-ADDRESS
syn keyword clipsSystemClasses    INSTANCE-NAME INTEGER LEXEME MULTIFIELD NUMBER OBJECT PRIMITIVE STRING SYMBOL USER
syn keyword clipsTemplate         deftemplate-module deftemplate-slot-allowed-values deftemplate-slot-cardinality
syn keyword clipsTemplate         deftemplate-slot-default_value deftemplate-slot-defaultp deftemplate-slot-existp
syn keyword clipsTemplate         deftemplate-slot-multip deftemplate-slot-names deftemplate-slot-range deftemplate-slot-singlep
syn keyword clipsTemplate         deftemplate-slot-types get-deftemplate-list list-deftemplates ppdeftemplate undeftemplate
syn keyword clipsText             fetch get-region print-region toss

syn keyword clipsCOOLClass        browse-classes class class-abstractp class-existp class-reactivep class-subclasses class-superclasses
syn keyword clipsCOOLClass        defclass-module describe-class get-class-defaults-mode get-defclass-list list-defclasses ppdefclass
syn keyword clipsCOOLClass        set-class-defaults-mode subclassp superclassp undefclass
syn keyword clipsCOOLInstance     active-duplicate-instance active-initialize-instance active-make-instance active-modify-instance
syn keyword clipsCOOLInstance     any-instancep bload-instances bsave-instances definstances-module delayed-do-for-all-instances
syn keyword clipsCOOLInstance     delete-instance direct-duplicate do-for-all-instances do-for-instance duplicate-instance
syn keyword clipsCOOLInstance     find-all-instances find-instance get-definstances-list initialize-instance instance-address
syn keyword clipsCOOLInstance     instance-addressp instance-existp instance-name instance-namep instance-name-to-symbol instancep
syn keyword clipsCOOLInstance     instances list-definstances load-instances make-instance modify-instance object-pattern-match-delay
syn keyword clipsCOOLInstance     ppdefinstances ppinstance restore-instances save-instances send symbol-to-instance-name undefinstances
syn keyword clipsCOOLInstance     unmake-instance
syn keyword clipsCOOLMessage      active-message-duplicate-instance active-message-modify-instance call-next-handler
syn keyword clipsCOOLMessage      get-defmessage-handler-list list-defmessage-handlers message-duplicate
syn keyword clipsCOOLMessage      message-duplicate-instance message-handler-existp message-modify-instance next-handlerp
syn keyword clipsCOOLMessage      override-next-handler ppdefmessage-handler preview-send undefmessage-handler
syn keyword clipsCOOLSSlot        class-slots direct-mv-delete direct-mv-insert direct-mv-replace dynamic-get dynamic-put get
syn keyword clipsCOOLSSlot        init-slots mv-slot-delete mv-slot-insert mv-slot-replace put slot-allowed-classes
syn keyword clipsCOOLSSlot        slot-allowed-values slot-cardinality slot-default-value slot-delete$ slot-direct-accessp
syn keyword clipsCOOLSSlot        slot-direct-delete$ slot-direct-insert$ slot-direct-replace$ slot-existp slot-facets slot-initablep
syn keyword clipsCOOLSSlot        slot-insert$ slot-publicp slot-range slot-replace$ slot-sources slot-types slot-writablep

hi def link clipsAgenda           Function
hi def link clipsBoolean          Boolean
hi def link clipsComment          Comment
hi def link clipsConditional      Conditional
hi def link clipsConstruct        Structure
hi def link clipsDebugging        Debug
hi def link clipsEnvironment      Keyword
hi def link clipsFact             Function
hi def link clipsFloat            Float
hi def link clipsFunction         Function
hi def link clipsFocus            Function
hi def link clipsGeneric          Function
hi def link clipsGlobal           Function
hi def link clipsIdentifier       Identifier
hi def link clipsInteger          Number
hi def link clipsIO               Keyword
hi def link clipsIOFormat         Keyword
hi def link clipsIOName           Keyword
hi def link clipsIOSpecial        Keyword
hi def link clipsLabel            Lable
hi def link clipsMath             Function
hi def link clipsMemory           Debug
hi def link clipsMiscClasses      Type
hi def link clipsMiscellaneous    Function
hi def link clipsModule           Function
hi def link clipsModuleSpecifier  Special
hi def link clipsMultifield       Function
hi def link clipsPredicate        Conditional
hi def link clipsProcedural       Function
hi def link clipsProfiling        Debug
hi def link clipsRepeat           Repeat
hi def link clipsRule             Function
hi def link clipsRuleProperty     Special
hi def link clipsSequence         Function
hi def link clipsSlotAttribute    Special
hi def link clipsSlotDefinition   Define
hi def link clipsSpecial1         Special
hi def link clipsSpecial2         Special
hi def link clipsSpecial3         Special
hi def link clipsSpecial4         Special
hi def link clipsString           Function
hi def link clipsSystemClasses    Type
hi def link clipsTemplate         Function
hi def link clipsText             Function
hi def link clipsTextString       String
hi def link clipsTODO             Todo

hi def link clipsCOOLClass        Function
hi def link clipsCOOLInstance     Function
hi def link clipsCOOLMessage      Function
hi def link clipsCOOLSSlot        Function

let b:current_syntax = 'clips'
