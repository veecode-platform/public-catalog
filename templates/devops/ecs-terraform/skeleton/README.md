# Build Image


```bash
docker build -t my-health-check-app .
```

# AWS

**Variables**
`$AWS_REGION`
`$AWS_ACCESS_KEY_ID`
`$AWS_SECRET_ACCESS_KEY`
`$CLUSTER_NAME`

**Check login**

```bash
aws sts get-caller-identity
```

**Aws configure**

```bash
aws configure
```

**Amazon ECR Login**

```bash
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCESS_KEY_ID.dkr.ecr.$AWS_REGION.amazonaws.com
```

**Create Repository**

```bash
aws ecr create-repository --repository-name my-health-check-app
```

**Step push image to repository**

```bash
tag my-health-check-app:latest <seu-id-da-conta>.dkr.ecr.<sua-região>.amazonaws.com/my-health-check-app:latest

docker push <seu-id-da-conta>.dkr.ecr.<sua-região>.amazonaws.com/my-health-check-app:latest
```

**Create ECS Service**