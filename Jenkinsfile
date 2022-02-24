pipeline {
    agent any
    stages{
        stage('Cluster Creation'){
            steps{
                withAWS(credentials: 'aws-static'){
                    sh''' 
                    ekstcl create cluster \
                       --name eks_cluster_ayush \
                       --version 1.18 \
                       --region ap-suth-1 \
                       --role_arn aws_iam_role.eks_cluster.arn \
                       --subnet_ids ["aws_subnet_public-subnet-1.id","aws_subnet_public-subnet-2.id"] \

                    '''
                }
            }
        }

        stage('Node Creation'){
            steps{
                withAWS(credentials: 'aws-static'){
                    sh''' 
                    ekstcl create node \
                       --cluster_name aws_eks_cluster.aws_eks.name\
                       --node_group_name node_ayush\
                       --node_role_arn aws_iam_role.eks_nodes.arn\
                       --subnet_ids ["aws_subnet_public-subnet-1.id","aws_subnet_public-subnet-2.id"] \
                       --node-type t2.small
                       --nodes 3\
                       --nodes-min 1 \
                       --nodes-max 4 \

                    '''
                }
            }
        }
    }
}