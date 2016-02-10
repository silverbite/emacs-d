<?php

$xt_fixers = [
    [
        'fixer'   => 'psr0',
        'comment' => 'Classes must be in a path that matches their namespace, be at least one namespace deep, and the class name should match the file name.', // [PSR-0]
        'enabled' => true,
    ],
    [
        'fixer'   =>'encoding',
        'comment' => 'PHP code MUST use only UTF-8 without BOM (remove BOM).', // [PSR-1]
        'enabled' => true,
    ],
    [
        'fixer'   => 'short_tag',
        'comment' => 'PHP code must use the long <?php ?> tags or the short-echo <?= ?> tags; it must not use the other tag variations.', // [PSR-1]
        'enabled' => true,
    ],
    [
        'fixer'   => 'braces',
        'comment' => 'The body of each structure MUST be enclosed by braces. Braces should be properly placed. Body of braces should be properly indented.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'class_definition',
        'comment' => 'Whitespace around the key words of a class, trait or interfaces definition should be one space.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'elseif',
        'comment' => 'The keyword elseif should be used instead of else if so that all control keywords looks like single words.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'eof_ending',
        'comment' => 'A file must always end with a single empty line feed.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'function_call_space',
        'comment' => 'When making a method or function call, there MUST NOT be a space between the method or function name and the opening parenthesis.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'function_declaration',
        'comment' => 'Spaces should be properly placed in a function declaration.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'indentation',
        'comment' => 'Code MUST use an indent of 4 spaces, and MUST NOT use tabs for indenting.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'line_after_namespace',
        'comment' => 'There MUST be one blank line after the namespace declaration.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'linefeed',
        'comment' => 'All PHP files must use the Unix LF (linefeed) line ending.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'lowercase_constants',
        'comment' => 'The PHP constants true, false, and null MUST be in lower case.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'lowercase_keywords',
        'comment' => 'PHP keywords MUST be in lower case.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'method_argument_space',
        'comment' => 'In method arguments and method call, there MUST NOT be a space before each comma and there MUST be one space after each comma.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'multiple_use',
        'comment' => 'There MUST be one use keyword per declaration.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'no_trailing_whitespace_in_comment',
        'comment' => 'There MUST be no trailing spaces inside comments and phpdocs.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'parenthesis',
        'comment' => 'There MUST NOT be a space after the opening parenthesis. There MUST NOT be a space before the closing parenthesis.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'php_closing_tag',
        'comment' => 'The closing ?> tag MUST be omitted from files containing only PHP.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'single_line_after_imports',
        'comment' => 'Each namespace use MUST go on its own line and there MUST be one blank line after the use statements block.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'switch_case_semicolon_to_colon',
        'comment' => 'A case should be followed by a colon and not a semicolon.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'switch_case_space',
        'comment' => 'Removes extra spaces between colon and case value.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'trailing_spaces',
        'comment' => 'Remove trailing whitespace at the end of non-blank lines.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'visibility',
        'comment' => 'Visibility MUST be declared on all properties and methods; abstract and final MUST be declared before the visibility; static MUST be declared after the visibility.', // [PSR-2]
        'enabled' => true,
    ],
    [
        'fixer'   => 'array_element_no_space_before_comma',
        'comment' => 'In array declaration, there MUST NOT be a whitespace before each comma.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'array_element_white_space_after_comma',
        'comment' => 'In array declaration, there MUST be a whitespace after each comma.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'blankline_after_open_tag',
        'comment' => 'Ensure there is no code on the same line as the PHP open tag and it is followed by a blankline.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'concat_without_spaces',
        'comment' => 'Concatenation should be used without spaces.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'double_arrow_multiline_whitespaces',
        'comment' => 'Operator => should not be surrounded by multi-line whitespaces.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'duplicate_semicolon',
        'comment' => 'Remove duplicated semicolons.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'empty_return',
        'comment' => 'A return statement wishing to return nothing should be simply "return".', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'extra_empty_lines',
        'comment' => 'Removes extra empty lines.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'function_typehint_space',
        'comment' => 'Add missing space between function\'s argument and its typehint.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'hash_to_slash_comment',
        'comment' => 'Single line comments should use double slashes and not hash.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'heredoc_to_nowdoc',
        'comment' => 'Convert heredoc to nowdoc if possible.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'include',
        'comment' => 'Include/Require and file path should be divided with a single space. File path should not be placed under brackets.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'join_function',
        'comment' => 'Implode function should be used instead of join function.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'list_commas',
        'comment' => 'Remove trailing commas in list function calls.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'lowercase_cast',
        'comment' => 'Cast should be written in lower case.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'method_argument_default_value',
        'comment' => 'In method arguments there must not be arguments with default values before non-default ones.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'multiline_array_trailing_comma',
        'comment' => 'PHP multi-line arrays should have a trailing comma.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'namespace_no_leading_whitespace',
        'comment' => 'The namespace declaration line shouldn\'t contain leading whitespace.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'native_function_casing',
        'comment' => 'Function defined by PHP should be called using the correct casing.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'new_with_braces',
        'comment' => 'All instances created with new keyword must be followed by braces.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'no_blank_lines_after_class_opening',
        'comment' => 'There should be no empty lines after class opening brace.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'no_empty_lines_after_phpdocs',
        'comment' => 'There should not be blank lines between docblock and the documented element.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'object_operator',
        'comment' => 'There should not be space before or after object T_OBJECT_OPERATOR.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'operators_spaces',
        'comment' => 'Binary operators should be surrounded by at least one space.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_indent',
        'comment' => 'Docblocks should have the same indentation as the documented subject.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_inline_tag',
        'comment' => 'Fix phpdoc inline tags, make inheritdoc always inline.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_no_access',
        'comment' => '@access annotations should be omitted from phpdocs.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_no_empty_return',
        'comment' => '@return void and @return null annotations should be omitted from phpdocs.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_no_package',
        'comment' => '@package and @subpackage annotations should be omitted from phpdocs.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_params',
        'comment' => 'All items of the @param, @throws, @return, @var, and @type phpdoc tags must be aligned vertically.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_scalar',
        'comment' => 'Scalar types should always be written in the same form. "int", not "integer"; "bool", not "boolean"; "float", not "real" or "double".', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_separation',
        'comment' => 'Annotations in phpdocs should be grouped together so that annotations of the same type immediately follow each other, and annotations of a different type are separated by a single blank line.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'pdoc_short_description** [symfony]',
        'comment' => 'Phpdocs short descriptions should end in either a full stop, exclamation mark, or question mark.', //
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_to_comment',
        'comment' => 'Docblocks should only be used on structural elements.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_trim',
        'comment' => 'Phpdocs should start and end with content, excluding the very first and last line of the docblocks.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_type_to_var',
        'comment' => '@type should always be written as @var.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_types',
        'comment' => 'The correct case must be used for standard PHP types in phpdoc.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_var_without_name',
        'comment' => '@var and @type annotations should not contain the variable name.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'pre_increment',
        'comment' => 'Pre incrementation/decrementation should be used if possible.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'print_to_echo',
        'comment' => 'Converts print language construct to echo if possible.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'remove_leading_slash_use',
        'comment' => 'Remove leading slashes in use clauses.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'remove_lines_between_uses',
        'comment' => 'Removes line breaks between use statements.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'return',
        'comment' => 'An empty line feed should precede a return statement.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'self_accessor',
        'comment' => 'Inside a classy element "self" should be preferred to the class name itself.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'short_bool_cast',
        'comment' => 'Short cast bool using double exclamation mark should not be used.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'short_scalar_cast',
        'comment' => 'Cast "(boolean)" and "(integer)" should be written as "(bool)" and "(int)". "(double)" and "(real)" as "(float)".', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'single_array_no_trailing_comma',
        'comment' => 'PHP single-line arrays should not have trailing comma.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'single_blank_line_before_namespace',
        'comment' => 'There should be exactly one blank line before a namespace declaration.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'single_quote',
        'comment' => 'Convert double quotes to single quotes for simple strings.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'spaces_after_semicolon',
        'comment' => 'Fix whitespace after a semicolon.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'spaces_before_semicolon',
        'comment' => 'Single-line whitespace before closing semicolon are prohibited.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'spaces_cast',
        'comment' => 'A single space should be between cast and variable.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'standardize_not_equal',
        'comment' => 'Replace all <> with !=.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'ternary_spaces',
        'comment' => 'Standardize spaces around ternary operator.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'trim_array_spaces',
        'comment' => 'Arrays should be formatted like function/method arguments, without leading or trailing single line space.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'unalign_double_arrow',
        'comment' => 'Unalign double arrow symbols.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'unalign_equals',
        'comment' => 'Unalign equals symbols.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'unary_operators_spaces',
        'comment' => 'Unary operators should be placed adjacent to their operands.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'unneeded_control_parentheses',
        'comment' => 'Removes unneeded parentheses around control statements.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   =>  'unused_use',
        'comment' => 'Unused use statements must be removed.', // [symfony]
        'enabled' => TRUE,
    ],
    [
        'fixer'   => 'whitespacy_lines',
        'comment' => 'Remove trailing whitespace at the end of blank lines.', // [symfony]
        'enabled' => true,
    ],
    [
        'fixer'   => 'align_double_arrow',
        'comment' => 'Align double arrow symbols in consecutive lines.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'align_equals',
        'comment' => 'Align equals symbols in consecutive lines.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'concat_with_spaces',
        'comment' => 'Concatenation should be used with at least one whitespace around.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'echo_to_print',
        'comment' => 'Converts echo language construct to print if possible.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'ereg_to_preg',
        'comment' => 'Replace deprecated ereg regular expression functions with preg. Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'header_comment',
        'comment' => 'Add, replace or remove header comment.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'logical_not_operators_with_spaces',
        'comment' => 'Logical NOT operators (!) should have leading and trailing whitespaces.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'logical_not_operators_with_successor_space',
        'comment' => 'Logical NOT operators (!) should have one trailing whitespace.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'long_array_syntax',
        'comment' => 'Arrays should use the long syntax.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'multiline_spaces_before_semicolon',
        'comment' => 'Multi-line whitespace before closing semicolon are prohibited.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'newline_after_open_tag',
        'comment' => 'Ensure there is no code on the same line as the PHP open tag.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'no_blank_lines_before_namespace',
        'comment' => 'There should be no blank lines before a namespace declaration.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'no_useless_return',
        'comment' => 'There should not be an empty return statement at the end of a function.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'ordered_use',
        'comment' => 'Ordering use statements.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'php4_constructor',
        'comment' => 'Convert PHP4-style constructors to __construct. Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'php_unit_construct',
        'comment' => 'PHPUnit assertion method calls like "->assertSame(true, $foo)" should be written with dedicated method like "->assertTrue($foo)". Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'php_unit_strict',
        'comment' => 'PHPUnit methods like "assertSame" should be used instead of "assertEquals". Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_order',
        'comment' => 'Annotations in phpdocs should be ordered so that param annotations come first, then throws annotations, then return annotations.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'phpdoc_var_to_type',
        'comment' => '@var should always be written as @type.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'short_array_syntax',
        'comment' => 'PHP arrays should use the PHP 5.4 short-syntax.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'short_echo_tag',
        'comment' => 'Replace short-echo <?= with long format <?php echo syntax.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'strict',
        'comment' => 'Comparison should be strict. Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
    [
        'fixer'   => 'ict_param',
        'comment' => 'Functions should be used with $strict param. Warning! This could change code behavior.', // [contrib]
        'enabled' => true,
    ],
];

$finder = Symfony\CS\Finder\DefaultFinder::create()
        ->in(__DIR__);

$config = Symfony\CS\Config::create()
        ->level(Symfony\CS\FixerInterface::NONE_LEVEL);

$fixers = [];

foreach ($xt_fixers as $fixer_arr)
{
    if ($fixer_arr['enabled'])
    {
        $fixers[] = $fixer_arr['fixer'];
    }
}

return $config->fixers($fixers)
    ->finder($finder);
