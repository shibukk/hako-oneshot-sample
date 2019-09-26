{
  scheduler: {
    type: 'ecs',
    region: 'ap-northeast-1',
    cluster: 'hako-oneshot-sample-cluster',
    // Fargate
    execution_role_arn: 'arn:aws:iam::012345678901:role/ecsTaskExecutionRole',
    cpu: '1024',
    memory: '2048',
    requires_compatibilities: ['FARGATE'],
    network_mode: 'awsvpc',
    launch_type: 'FARGATE',
    network_configuration: {
      awsvpc_configuration: {
        subnets: ['subnet-XXXXXXXXXXXXXXXXX'],
        security_groups: [],
        assign_public_ip: 'ENABLED',
      },
    },
  },
  app: {
    image: 'technosophos/slack-notify',
    cpu: 1024,
    memory: 256,
    memory_reservation: 128,
    env: {
      SLACK_WEBHOOK: 'https://hooks.slack.com/services/XXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZZZZZZZZZZZ',
      SLACK_MESSAGE: 'hello!',
    },
    log_configuration: {
      log_driver: 'awslogs',
      options: {
        'awslogs-group': '/ecs/hako-oneshot-sample',
        'awslogs-region': 'ap-northeast-1',
        'awslogs-stream-prefix': 'ecs',
      },
    },
  },
}
