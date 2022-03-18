<script type="application/javascript">
	pageType = document.getElementsByTagName("body")[0].id.toLowerCase().trim()
	if (pageType === 'post') {
			function wordCount(words) {
							var count = 0
							for (var i = 0; i < words.length; i++) {
											count += words[i].textContent.split(" ").length
							}
							return count
			}
			wordCount = wordCount(document.getElementsByClassName("entry-content"))
			publishTime = document.querySelectorAll('#main > article > div > footer > span.entry-date.date.published > time')[0].dateTime
			blogTitle = document.querySelector('#main > article > div > header > h1').innerText
			blogDetails = {
							event: 'read_blog_post',
							wordCount: wordCount,
							publishTime: publishTime,
							blogTitle: blogTitle
			}

			dataLayer.push(blogDetails)
	}
	</script>
