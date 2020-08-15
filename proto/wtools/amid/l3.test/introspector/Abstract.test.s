( function _Introspector_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../../wtools/Tools.s' );
  _.include( 'wTesting' );
  require( '../../l3/introspector/module/Full.s' );

}

//

let _ = _global_.wTools;
var fileProvider = _.fileProvider;
var path = fileProvider.path;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  self.suiteTempPath = path.tempOpen( path.join( __dirname, '../..'  ), 'err' );
  self.assetsOriginalPath = path.join( __dirname, '_asset' );

}

//

function onSuiteEnd()
{
  let self = this;
  _.assert( _.strHas( self.suiteTempPath, '/err-' ) )
  path.tempClose( self.suiteTempPath );
}

// --
// assets
// --

// --
// tests
// --

// --
// declare
// --

var Proto =
{

  name : 'Tools.mid.Introspector',
  silencing : 1,
  abstract : 1,
  routineTimeOut : 30000,

  onSuiteBegin,
  onSuiteEnd,

  context :
  {

    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
    defaultParser : null,
    defaultProgramSourceCode : null,

  },

  tests :
  {

  },

}

//

let Self = new wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();