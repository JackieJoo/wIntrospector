( function _JsUglify_test_s_( )
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../wtools/Tools.s' );
  require( './JsAbstract.test.s' );

}

//

let _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;
let Parent = wTests[ 'Tools.mid.Introspector.JsAbstract' ];

// --
// tests
// --

function parseStringSpecial( test )
{
  let context = this;
  let sourceCode = context.defaultProgramSourceCode;

  test.description = 'setup';

  test.true( _.constructorIs( _.introspector.Parser.JsUglify ) );
  test.true( _.constructorIs( context.defaultParser ) );
  test.true( context.defaultParser === _.introspector.Parser.JsUglify );
  let sys = _.introspector.System({ defaultParserClass : context.defaultParser });
  let file = _.introspector.File({ data : sourceCode, sys });
  file.refine();
  logger.log( file.productExportInfo() );
  test.true( file.parser.constructor === context.defaultParser );

  test.description = 'nodes';
  test.identical( file.product.nodes.length, 165 ); /* 152 */
  test.identical( _.mapKeys( file.product.byType ).length, 31 ); /* 28 */
  test.identical( file.product.byType.gRoutine.length, 8 );

  test.description = 'root';
  test.identical( file.product.byType.Toplevel.length, 1 );
  test.true( file.product.byType.Toplevel.first() === file.product.root );

  /*
    the most broken JS parser among added!
  */

  debugger;
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

  name : 'Tools.mid.Introspector.JsUglify',

  context :
  {

    defaultParser : _.introspector.Parser.JsUglify,

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
