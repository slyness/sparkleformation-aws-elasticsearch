## SparkleFormation AWS::Elasticsearch::Domain Example

This is a [SparkleFormation](http://sparkleformation.io) template example for creating
an [AWS Elasticsearch Service Cluster](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticsearch-domain.html).

[This template](https://github.com/slyness/sparkleformation-aws-elasticsearch/blob/master/sparkleformation/elasticsearch.rb) is an implementation
of the CloudFormation resource [example](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-elasticsearch-domain.html#d0e51492) provided for `AWS::Elasticsearch::Domain`.

And now, because my CloudFormation template is expressed using SparkleFormation I have a re-usable and updatable way to create Amazon AWS Resources.
Like as many Elasticsearch domains I would ever need. Woooo!

As you will see I have parameterized some of the more interesting or important configuration settings. You can chose which elasticsearch instance type you determine your cluster members
should run on, choose how many master only and master data instances should be created to make the cluster, and choose the size of the EBS volume for data. Notice I've also been able to
limit the instance types that are available to choose from.

This was some personal practice. However, I also wrote it as and example of using SparkleFormation to create a CloudFormation stack implementing a AWS CloudFormation Resource.
Thus using SparkleFormation to directly describe the example in the documentation so they can be compared to each other.

I also wanted to set up the repository so that it is easy for anyone to give `sfn` and SparkleFormation a try. You just need to have ruby and bundler installed, clone this repository
and run `bundle install`. Oh and set a couple of environment variables....

I encourage you to give it a shot.

A few commands to remember:

* `bundle exec sfn create mystack`
* `bundle exec sfn destroy mystack`
* And if you'd like to look at the json CloudFormation template that this template creates
  * `bundle exec sfn print mystack --file sparkleformation/elasticsearch.rb`

See [Usage](#usage) for steps to build a stack.

What is SparkleFormation?
[SparkleFormation Documentation](http://www.sparkleformation.io/docs/sparkle_formation/sparkleformation-dsl.html)

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
[SparkleFormation](http://www.sparkleformation.io/docs/sparkle_formation/) and the [sfn](http://www.sparkleformation.io/docs/sfn) are installed as gems using bundler.
You will need to make sure Ruby and bundler are installed.

### Usage

* Clone repository
  * `git clone https://github.com/slyness/sparkleformation-aws-elasticsearch.git`
* Set appropriate environment variables
  * [See Dependencies](#environment-variables)
* `bundle install`
* `bundle exec sfn create elasticsearch --file elasticsearch`

![](http://i.imgur.com/01H017M.gif)

