( function _TsMicrosoft_test_s_( )
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../wtools/Tools.s' );
  require( './TsAbstract.test.s' );

}

//

let _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;
let Parent = wTests[ 'Tools.mid.Introspector.Ts' ];

// --
// tests
// --

function parseStringSpecial( test )
{
  let context = this;
  let sourceCode = context.defaultProgramSourceCode;

  test.description = 'setup';
  test.true( _.constructorIs( _.introspector.Parser.TsMicrosoft ) );
  test.true( _.constructorIs( context.defaultParser ) );
  test.true( context.defaultParser === _.introspector.Parser.TsMicrosoft );
  let sys = _.introspector.System({ defaultParserClass : context.defaultParser });
  let file = _.introspector.File({ data : sourceCode, sys });
  file.refine();
  logger.log( file.productExportInfo() );
  test.true( file.parser.constructor === context.defaultParser );

  test.description = 'nodes';
  test.identical( file.product.nodes.length, 52 );
  test.identical( _.mapKeys( file.product.byType ).length, 16 );

  test.description = 'root';
  test.identical( file.product.byType.SourceFile.length, 1 );
  test.true( file.product.byType.SourceFile.first() === file.product.root );

  /*

  file.nodeCode( file.product.byType.CallExpression.toArray().original[1].arguments[1] )
  " () => console.log( 'arrow1' )"

  file.nodeType( file.product.byType.CallExpression.toArray().original[1].arguments[1] )
  "ArrowFunction"

  */

  return null;
}

parseStringSpecial.description =
`
Parsing from string with espima js parser produce proper AST.
`

// --
// declare
// --

var Proto =
{

  name : 'Tools.mid.Introspector.TsMicrosoft',

  context :
  {

    defaultParser : _.introspector.Parser.TsMicrosoft,

  },

  tests :
  {

    parseStringSpecial,

  },

}

//

let Self = new wTestSuite( Proto ).inherit( Parent );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
