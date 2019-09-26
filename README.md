# hako-oneshot-sample

## Installation

Execute this command:

```bash
$ bundle install --path vendor/bundle
```

## Usage

1. Create ECS cluster on AWS Console.  
Then please choose `[Networking only]`.
1. [Create IAM Role](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html) if needed.
1. Replace IAM Role / ECS cluster / Subnet on configuration jsonnet file.
1. [Create Incoming WebHooks integration](https://slack.com/services/new/incoming-webhook).
1. Copy sample environment file.
    ```
    $ cp .env.sample .env
    ```
1. Replace Slack Webhook URL on environment file.
1. Oneshot!
    ```
    $ bundle exec hako oneshot fargate-onshot.jsonnet /slack-notify 'SLACK_WEBHOOK=$SLACK_WEBHOOK SLACK_MESSAGE=$SLACK_MESSAGE'
    ```
