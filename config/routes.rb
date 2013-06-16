# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(HomeAction)
  post('/prepare').to(PrepareAction)
  post('/refresh').to(RefreshAction)
  get('/pull').to(PullAction)
  get('/info').to(InfoAction)
end
