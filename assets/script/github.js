if(String.prototype.repeat === undefined)
	String.prototype.repeat = function(num) {
		return new Array(num + 1).join(this);
	}

var user_repos;
if(!user_repos)
	user_repos = [];


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
			console.log(allrepos);
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

	var temp = 'Show <input type="text" value="nabijaczleweli" id="' + elemid + '_input_username"></input>\'s...<br />';
	temp += '&nbsp;&nbsp;<span id="' + elemid + '_switch_all">repos</span><br />';
	temp += '&nbsp;&nbsp;<span id="' + elemid + '_switch_forks">forks</span><br />';
	temp += '&nbsp;&nbsp;<span id="' + elemid + '_switch_sources">sources</span>';

	document.getElementById(elemid).innerHTML = temp;
	onclick_delegate('all');
	onclick_delegate('forks');
	onclick_delegate('sources');
}


var __github_repos_no_hits_row;
if(__github_repos_no_hits_row === undefined)
	__github_repos_no_hits_row = '<tr>' + '<td><center><b style="color: red;">No hits</b></center>'.repeat(2) + '</tr>';
function __github_repos(repos, elem) {
	var tbl = '<table id="github_repos"><tr><th>Repo name</th><th>Repo description</th></tr>'
	if(repos[repos.current].length) {
		for(var i = 0; i < repos[repos.current].length; i++)
			tbl += '<tr><td>' + repos[repos.current][i].name + '</td><td>' + repos[repos.current][i].description + '</td></tr>';
	} else
		tbl += __github_repos_no_hits_row;
	tbl += '</table>';

	elem.innerHTML = tbl;
}
