import React from 'react';
import { render } from 'react-dom';
import { browserHistory, Router, Route, Link } from 'react-router';
import auth from './utils/auth';
import Login from './components/login';

const App = React.createClass({
  getInitialState() {
    return {
      loggedIn: auth.loggedIn()
    }
  },

  updateAuth(loggedIn) {
    this.setState({
      loggedIn: loggedIn
    });
  },

  componentWillMount() {
    auth.onChange = this.updateAuth;
    auth.login();
  },

  render() {
    return (
      <div>
        <ul>
          <li>
            {this.state.loggedIn ? (
              <Link to="/logout">Log out</Link>
            ) : (
              <Link to="/login">Sign in</Link>
            )}
          </li>
          <li><Link to="/about">About</Link></li>
          <li><Link to="/dashboard">Dashboard</Link> (authenticated)</li>
        </ul>
        {this.props.children || <p>You are {!this.state.loggedIn && 'not'} logged in.</p>}
      </div>
    )
  }
})

function requireAuth(nextState, replace) {
  if (!auth.loggedIn()) {
    replace({
      pathname: '/login',
      state: { nextPathname: nextState.location.pathname }
    });
  }
}

// render((
//   <Router history={browserHistory}>
//     <Route path="/" component={App}>
//       <Route path="login" component={Login} />
//       <Route path="logout" component={Logout} />
//       <Route path="home" component={Home} onEnter={requireAuth} />
//     </Route>
//   </Router>
// ), document.getElementById('root'));
render((
  <Router history={browserHistory}>
    <Route path="/" component={App}>
      <Route path="login" component={Login} />
    </Route>
  </Router>
), document.getElementById('root'));
