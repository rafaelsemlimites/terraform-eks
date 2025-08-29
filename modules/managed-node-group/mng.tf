resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b
  ]
  tags = var.tags

  # ARM/Graviton + Spot (baratíssimo)
  ami_type       = "AL2023_ARM_64_STANDARD"
  instance_types = ["t4g.small"]
  capacity_type  = "SPOT"



  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_woeker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
  ]
}