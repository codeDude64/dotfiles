local config = require'snippets'

config.snippets = {
  _global = {
    todo = '// TODO(Salvador):';
  };
  lua = {
    req = [[local ${2:$1} = require '$1']];
    ["for"] = [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  c = {
    ["#if"] = [[
#if ${1:CONDITION}
$0
#endif // $1
]];
  };
  javascriptreact = {
    imr = [[import React from 'react';]];
    imrc = [[import React, { Component } from 'react';]];
    imrs = [[import React, { useState } from 'react';]];
    imrse = [[import React, { useState, useEffect } from 'react';]];
    impt = [[import PropTypes from 'prop-types';]];
    impc = [[import React, { PureComponent } from 'react';]];
    cc = [[
class ${1:MyComponent} extends Component {
  state = {  },
    render() {
      return ( $0 );
    }
}

export default ${1:MyComponent};]];
    ccc = [[
class ${1:MyComponent} extends Component {
  constructor(props) {
    super(props);
    this.state = {  };
  }
  render() {
    return ( $0 );
  }
}

export default ${1:MyComponent};]];
    rfc = [[
const ${1:MyComponent} = () => {
  return ( $0 );
};

export default ${1:MyComponent};]];
    usf = [[
const [${1:State}, set${1:State}] = useState($0);
]];
    uef = [[useEffect(() => {$0}, []);]];
    cdm = [[
componentDidMount() {
  $0
}]];
  }
}
