## SparkleFormation AWS::Elasticsearch::Domain Example

This is a [SparkleFormation](http://sparkleformation.io) template example for creating
an [AWS Elasticsearch Service Cluster](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticsearch-domain.html).

[This template](https://github.com/slyness/sparkleformation-aws-elasticsearch/blob/master/sparkleformation/elasticsearch.rb) produces a implementation
of the CloudFormation [EXAMPLE](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticsearch-domain.html#d0e51492) provided for `AWS::Elasticsearch::Domain`.

### Dependencies

#### Environment Variables

You are required to set three environment variables to provide
correct authentication information to AWS.

```
export AWS_ACCESS_KEY_ID="AKIAINSANIKEY322BPKQ"
export AWS_SECRET_ACCESS_KEY="jkasdfjA/DJFASDJF1ASCRAZYKEY009235jadf"
export AWS_REGION="us-west-2"
```

#### SparkleFormation Configuration

`sfn` is configured with the `.sfn` file located in this repository.

#### Installation
[SparkleFormation](http://www.sparkleformation.io/docs/sparkle_formation/) and the [sfn](http://www.sparkleformation.io/docs/sfn) are installed using bundler.

`bundle install`

### Usage

* Clone repository `git clone https://github.com/slyness/sparkleformation-aws-elasticsearch.git`
* Set appropriate environment variables [See Dependencies](#environment-variables)
* `bundle install`
* `sfn create elasticsearch --file elasticsearch`

![](http://i.imgur.com/01H017M.gif)

