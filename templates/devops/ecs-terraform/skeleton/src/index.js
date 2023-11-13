const express = require('express');

const defaultRouter = require('./routes/default');
const healthCheckRouter = require('./routes/healthCheck');

const app = express();
const port = process.env.PORT || 5000;


app.use(defaultRouter);
app.use(healthCheckRouter);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
