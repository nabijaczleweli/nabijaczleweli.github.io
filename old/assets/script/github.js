if(String.prototype.repeat === undefined)
	String.prototype.repeat = function(num) {
		return new Array(num + 1).join(this);
	}

var user_repos;
if(!user_repos)
	user_repos = [];


function octicon(which) {
	return '<span class="octicon octicon-' + which + '"></span>';
}

function github_repos(username, elemid, hook) {
	const elem = document.getElementById(elemid);
	if(user_repos[username]) {
		if(hook)
			hook();
		return __github_repos(user_repos[username], elem);
	} else {
		const request = new XMLHttpRequest();
		request.open('GET', 'https://api.github.com/users/' + username + '/repos');
		request.onloadend = function(load) {
			const resprepos = JSON.parse(load.target.responseText);
			const allrepos  = (resprepos.length !== undefined) ? resprepos : [];
			user_repos[username] = {
				'current': 'all',
				'all': allrepos,
				'forks': allrepos.filter(function(repo) {
					return repo.fork;
				}),
				'sources': allrepos.filter(function(repo) {
					return !repo.fork;
				})
			};
			if(hook)
				hook();
			__github_repos(user_repos[username], elem);
		};
		request.send();
	}
}

function github_reposwitcher(repoelemid, elemid) {
	function onclick_delegate(which) {
		function __onclick_delegate() {
			const username = document.getElementById(elemid + '_input_username').value;

			github_repos(username, repoelemid, function() {
				user_repos[username].current = which;
			});
		}

		document.getElementById(elemid + '_switch_' + which).onclick = __onclick_delegate;
	}

	var temp = '<div class="github_get_prs"><input id="github_get_prs_toggle" type="checkbox">Poll PRs</input></div>'
	temp += 'Show <input type="text" value="nabijaczleweli" id="' + elemid + '_input_username"></input>\'s...<br />';
	temp += '&nbsp;&nbsp;<a href="javascript:;" id="' + elemid + '_switch_all">repos</a><br />';
	temp += '&nbsp;&nbsp;<a href="javascript:;" id="' + elemid + '_switch_forks">forks</a><br />';
	temp += '&nbsp;&nbsp;<a href="javascript:;" id="' + elemid + '_switch_sources">sources</a>';

	document.getElementById(elemid).innerHTML = temp;
	onclick_delegate('all');
	onclick_delegate('forks');
	onclick_delegate('sources');
}


var __github_repos_no_hits_row;
if(__github_repos_no_hits_row === undefined)
	__github_repos_no_hits_row = '<tr>' + '<td><center><b style="color: red;">No hits</b></center>'.repeat(6) + '</tr>';
var __github_repos_header_row;
if(__github_repos_header_row === undefined)
	__github_repos_header_row = '<table id="github_repos"><tr><th>Repo name</th><th>Repo description</th><th>' + octicon('star') + '</th><th>' + octicon('issue-opened') + '</th><th>' + octicon('git-pull-request') + '</th><th>' + octicon('eye') + '</th></tr>'
function __github_repos(repos, elem) {
	function a(where) {
		return '<a href="' + where + '">';
	}

	function fill_pulls(id, on) {
		const request = new XMLHttpRequest();
		request.open('GET', on.pulls_url.replace(/\/?{.*}\/?/, ''));
		request.onloadend = function(load) {
			const pulls = JSON.parse(load.target.responseText);
			on.pulls = pulls;
			on.open_pulls = pulls.filter(function(pull) {
				return pull.state === 'open';
			}).length;
			document.getElementById(id).innerHTML = on.open_pulls;
		};
		request.send();
	}


	const salt = Math.random();
	var tbl = __github_repos_header_row;
	if(repos[repos.current].length) {
		const current = repos[repos.current];
		for(var i = 0; i < current.length; i++) {
			tbl += '<tr><td>' + a(current[i].html_url) + current[i].name + '</a></td><td>' + current[i].description + '</td><td><center>' + current[i].stargazers_count + '</center></td><td><center id="github_repos_' + salt + '_' + i + '">' + current[i].open_issues_count + '</center></td><td><center';

			if(!document.getElementById('github_get_prs_toggle').checked)
				tbl += '>' + a(current[i].pulls_url.replace('api.', '').replace('repos/', '').replace(/\/?{.*}\/?/, '')) + octicon('git-pull-request') + '</a>';
			else if(current[i].open_pulls === undefined) {
				const centrid = 'github_repos_pulls_' + salt + '_' + i;
				tbl += ' id="' + centrid + '">' + octicon('cloud-download');
				fill_pulls(centrid, current[i]);
			} else
				tbl += '>' + current[i].open_pulls;

			tbl += '</center></td><td><center>'  + current[i].watchers_count + '</center></td></tr>';
		}
	} else
		tbl += __github_repos_no_hits_row;
	tbl += '</table>';

	elem.innerHTML = tbl;
}
