# Amazon CodeDeploy SDK

* [Version](#version)
* [Description](#description)
* [Contribute](#contribute)
* [Licence](#licence)


## Version

`1.4.3`


## Description

AWS CodeDeploy __Overview__

This reference guide provides descriptions of the AWS CodeDeploy APIs. For more information about AWS CodeDeploy, see the <docs.aws.amazon.com/codedeploy/latest/userguide AWS CodeDeploy User Guide>.

__Using the APIs__

You can use the AWS CodeDeploy APIs to work with the following:

-   Applications are unique identifiers used by AWS CodeDeploy to ensure the correct combinations of revisions, deployment configurations, and deployment groups are being referenced during deployments.

    You can use the AWS CodeDeploy APIs to create, delete, get, list, and update applications.

-   Deployment configurations are sets of deployment rules and success and failure conditions used by AWS CodeDeploy during deployments.

    You can use the AWS CodeDeploy APIs to create, delete, get, and list deployment configurations.

-   Deployment groups are groups of instances to which application revisions can be deployed.

    You can use the AWS CodeDeploy APIs to create, delete, get, list, and update deployment groups.

-   Instances represent Amazon EC2 instances to which application revisions are deployed. Instances are identified by their Amazon EC2 tags or Auto Scaling group names. Instances belong to deployment groups.

    You can use the AWS CodeDeploy APIs to get and list instance.

-   Deployments represent the process of deploying revisions to instances.

    You can use the AWS CodeDeploy APIs to create, get, list, and stop deployments.

-   Application revisions are archive files stored in Amazon S3 buckets or GitHub repositories. These revisions contain source content (such as source code, web pages, executable files, and deployment scripts) along with an application specification (AppSpec) file. (The AppSpec file is unique to AWS CodeDeploy; it defines the deployment actions you want AWS CodeDeploy to execute.) Ffor application revisions stored in Amazon S3 buckets, an application revision is uniquely identified by its Amazon S3 object key and its ETag, version, or both. For application revisions stored in GitHub repositories, an application revision is uniquely identified by its repository name and commit ID. Application revisions are deployed through deployment groups.

    You can use the AWS CodeDeploy APIs to get, list, and register application revisions.

Documentation is available via [Hackage](http://hackage.haskell.org/package/amazonka-codedeploy)
and the [AWS API Reference](https://aws.amazon.com/documentation/).

The types from this library are intended to be used with [amazonka](http://hackage.haskell.org/package/amazonka),
which provides mechanisms for specifying AuthN/AuthZ information and sending requests.

Use of lenses is required for constructing and manipulating types.
This is due to the amount of nesting of AWS types and transparency regarding
de/serialisation into more palatable Haskell values.
The provided lenses should be compatible with any of the major lens libraries
[lens](http://hackage.haskell.org/package/lens) or [lens-family-core](http://hackage.haskell.org/package/lens-family-core).

## Contribute

For any problems, comments, or feedback please create an issue [here on GitHub](https://github.com/brendanhay/amazonka/issues).

> _Note:_ this library is an auto-generated Haskell package. Please see `amazonka-gen` for more information.


## Licence

`amazonka-codedeploy` is released under the [Mozilla Public License Version 2.0](http://www.mozilla.org/MPL/).

Parts of the code are derived from AWS service descriptions, licensed under Apache 2.0.
Source files subject to this contain an additional licensing clause in their header.
