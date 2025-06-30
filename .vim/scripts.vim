if did_filetype() 
  finish
endif

if getline(1) =~ 'IDENTIFICATION DIVISION.'
  setfiletype cobol
endif


if getline(1) =~ 'CBL OPTIMIZE'
  setfiletype cobol
endif
