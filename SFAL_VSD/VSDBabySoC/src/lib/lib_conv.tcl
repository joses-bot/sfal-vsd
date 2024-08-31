set libfiles [glob sky*.lib]
foreach f $libfiles {
    read_lib $f
    set fblib [file rootname [file tail $f]]
    write_lib $fblib  -format db -output $fblib.db
}

