//==--- DiagnosticSerializationKinds.td - serialization diagnostics -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

let Component = "Serialization" in {
let CategoryName = "AST Deserialization Issue" in {

def err_fe_unable_to_read_pch_file : Error<
    "unable to read PCH file %0: '%1'">;
def err_fe_not_a_pch_file : Error<
    "input is not a PCH file: '%0'">;
def err_fe_pch_malformed : Error<
    "malformed or corrupted AST file: '%0'">, DefaultFatal;
def err_fe_pch_malformed_block : Error<
    "malformed block record in PCH file: '%0'">, DefaultFatal;
def err_fe_pch_file_modified : Error<
    "file '%0' has been modified since the precompiled header '%1' was built">,
    DefaultFatal;
def err_fe_module_file_modified : Error<
    "file '%0' has been modified since the module file '%1' was built">,
    DefaultFatal;
def err_fe_ast_file_modified : Error<
    "file '%0' has been modified since the AST file '%1' was built">,
    DefaultFatal;
def err_fe_pch_file_overridden : Error<
    "file '%0' from the precompiled header has been overridden">;
def note_pch_required_by : Note<"'%0' required by '%1'">;
def note_pch_rebuild_required : Note<"please rebuild precompiled header '%0'">;
def note_module_cache_path : Note<
    "after modifying system headers, please delete the module cache at '%0'">;

def err_pch_targetopt_mismatch : Error<
    "PCH file was compiled for the %0 '%1' but the current translation "
    "unit is being compiled for target '%2'">;
def err_pch_targetopt_feature_mismatch : Error<
    "%select{AST file|current translation unit}0 was compiled with the target "
    "feature'%1' but the %select{current translation unit is|AST file was}0 "
    "not">;
def err_pch_langopt_mismatch : Error<"%0 was %select{disabled|enabled}1 in "
    "PCH file but is currently %select{disabled|enabled}2">;
def err_pch_langopt_value_mismatch : Error<
  "%0 differs in PCH file vs. current file">;
def err_pch_diagopt_mismatch : Error<"%0 is currently enabled, but was not in "
  "the PCH file">;
def err_pch_modulecache_mismatch : Error<"PCH was compiled with module cache "
  "path '%0', but the path is currently '%1'">;
  
def err_pch_version_too_old : Error<
    "PCH file uses an older PCH format that is no longer supported">;
def err_pch_version_too_new : Error<
    "PCH file uses a newer PCH format that cannot be read">;
def err_pch_different_branch : Error<
    "PCH file built from a different branch (%0) than the compiler (%1)">;
def err_pch_with_compiler_errors : Error<
    "PCH file contains compiler errors">;

def err_module_file_conflict : Error<
  "module '%0' is defined in both '%1' and '%2'">, DefaultFatal;
def err_module_file_not_found : Error<
  "%select{PCH|module|AST}0 file '%1' not found%select{|: %3}2">, DefaultFatal;
def err_module_file_out_of_date : Error<
  "%select{PCH|module|AST}0 file '%1' is out of date and "
  "needs to be rebuilt%select{|: %3}2">, DefaultFatal;
def err_module_file_invalid : Error<
  "file '%1' is not a valid precompiled %select{PCH|module|AST}0 file">, DefaultFatal;
def note_module_file_imported_by : Note<
  "imported by %select{|module '%2' in }1'%0'">;
def err_module_file_not_module : Error<
  "AST file '%0' was not built as a module">, DefaultFatal;

def err_imported_module_not_found : Error<
    "module '%0' in AST file '%1' (imported by AST file '%2') "
    "is not defined in any loaded module map file; "
    "maybe you need to load '%3'?">, DefaultFatal;
def err_imported_module_modmap_changed : Error<
    "module '%0' imported by AST file '%1' found in a different module map file"
    " (%2) than when the importing AST file was built (%3)">, DefaultFatal;
def err_imported_module_relocated : Error<
    "module '%0' was built in directory '%1' but now resides in "
    "directory '%2'">, DefaultFatal;
def err_module_different_modmap : Error<
    "module '%0' %select{uses|does not use}1 additional module map '%2'"
    "%select{| not}1 used when the module was built">;

def err_pch_macro_def_undef : Error<
    "macro '%0' was %select{defined|undef'd}1 in the precompiled header but "
    "%select{undef'd|defined}1 on the command line">;
def err_pch_macro_def_conflict : Error<
    "definition of macro '%0' differs between the precompiled header ('%1') "
    "and the command line ('%2')">;
def err_pch_undef : Error<
    "%select{command line contains|precompiled header was built with}0 "
    "'-undef' but %select{precompiled header was not built with it|"
    "it is not present on the command line}0">;
def err_pch_pp_detailed_record : Error<
    "%select{command line contains|precompiled header was built with}0 "
    "'-detailed-preprocessing-record' but %select{precompiled header was not "
    "built with it|it is not present on the command line}0">;

def err_module_odr_violation_missing_decl : Error<
  "%q0 from module '%1' is not present in definition of %q2"
  "%select{ in module '%4'| provided earlier}3">, NoSFINAE;
def note_module_odr_violation_no_possible_decls : Note<
  "definition has no member %0">;
def note_module_odr_violation_possible_decl : Note<
  "declaration of %0 does not match">;
def err_module_odr_violation_different_definitions : Error<
  "%q0 has different definitions in different modules; "
  "%select{definition in module '%2' is here|defined here}1">;
def note_module_odr_violation_different_definitions : Note<
  "definition in module '%0' is here">;
def err_module_odr_violation_different_instantiations : Error<
  "instantiation of %q0 is different in different modules">;

def err_module_odr_violation_mismatch_decl : Error<
  "%q0 has different definitions in different modules; first difference is "
  "%select{definition in module '%2'|defined here}1 found "
  "%select{end of class|public access specifier|private access specifier|"
  "protected access specifier|static assert|field|method}3">;
def note_module_odr_violation_mismatch_decl : Note<"but in '%0' found "
  "%select{end of class|public access specifier|private access specifier|"
  "protected access specifier|static assert|field|method}1">;

def err_module_odr_violation_mismatch_decl_diff : Error<
  "%q0 has different definitions in different modules; first difference is "
  "%select{definition in module '%2'|defined here}1 found "
  "%select{"
  "static assert with condition|"
  "static assert with message|"
  "static assert with %select{|no }4message|"
  "field %4|"
  "field %4 with type %5|"
  "%select{non-|}5bitfield %4|"
  "bitfield %4 with one width expression|"
  "%select{non-|}5mutable field %4|"
  "field %4 with %select{no|an}5 initalizer|"
  "field %4 with an initializer|"
  "method %4|"
  "method %4 is %select{not deleted|deleted}5|"
  "method %4 is %select{|pure }5%select{not virtual|virtual}6|"
  "method %4 is %select{not static|static}5|"
  "method %4 is %select{not volatile|volatile}5|"
  "method %4 is %select{not const|const}5|"
  "method %4 is %select{not inline|inline}5}3">;

def note_module_odr_violation_mismatch_decl_diff : Note<"but in '%0' found "
  "%select{"
  "static assert with different condition|"
  "static assert with different message|"
  "static assert with %select{|no }2message|"
  "field %2|"
  "field %2 with type %3|"
  "%select{non-|}3bitfield %2|"
  "bitfield %2 with different width expression|"
  "%select{non-|}3mutable field %2|"
  "field %2 with %select{no|an}3 initializer|"
  "field %2 with a different initializer|"
  "method %2|"
  "method %2 is %select{not deleted|deleted}3|"
  "method %2 is %select{|pure }3%select{not virtual|virtual}4|"
  "method %2 is %select{not static|static}3|"
  "method %2 is %select{not volatile|volatile}3|"
  "method %2 is %select{not const|const}3|"
  "method %2 is %select{not inline|inline}3}1">;

def warn_module_uses_date_time : Warning<
  "%select{precompiled header|module}0 uses __DATE__ or __TIME__">,
  InGroup<DiagGroup<"pch-date-time">>;

def warn_duplicate_module_file_extension : Warning<
  "duplicate module file extension block name '%0'">,
  InGroup<ModuleFileExtension>;

def warn_module_system_bit_conflict : Warning<
  "module file '%0' was validated as a system module and is now being imported "
  "as a non-system module; any difference in diagnostic options will be ignored">,
  InGroup<ModuleConflict>;

} // let CategoryName
} // let Component

