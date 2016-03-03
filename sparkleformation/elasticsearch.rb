SparkleFormation.new(:elasticsearch) do
  set!('AWSTemplateFormatVersion', '2010-09-09')
  set!('Description', 'AWS Elasticsearch Service')

  parameters do
    domain_name do
      type 'String'
      default 'mydomain'
    end
    dedicated_master_instance_count do
      type 'String'
      default '3'
    end
    dedicated_master_instance_type do
      type 'String'
      default 't2.micro.elasticsearch'
      allowed_values %w(t2.micro.elasticsearch t2.small.elasticsearch m3.medium.elasticsearch)
    end
    master_instance_count do
      type 'String'
      default '2'
    end
    master_instance_type do
      type 'String'
      default 't2.micro.elasticsearch'
      allowed_values %w(t2.micro.elasticsearch t2.small.elasticsearch m3.medium.elasticsearch)
    end
    ebs_volume_size do
      type 'Number'
      default 20
    end
    ebs_volume_iops do
      type 'Number'
      default 0
    end
    snapshot_start_hour do
      type 'String'
      default '0'
    end
  end

  resources do
    my_company_elasticsearch do
      type "AWS::Elasticsearch::Domain"
      properties do
        domain_name ref!(:domain_name)
        elasticsearch_cluster_config do
          dedicated_master_enabled 'true'
          instance_count ref!(:master_instance_count)
          zone_awareness_enabled 'true'
          instance_type ref!(:master_instance_type)
          dedicated_master_type ref!(:dedicated_master_instance_type)
          dedicated_master_count ref!(:dedicated_master_instance_count)
        end
        set!('EBS_Options') do
          iops ref!(:ebs_volume_iops)
          volume_size ref!(:ebs_volume_size)
          volume_type 'gp2'
          set!('EBSEnabled', true)
        end
        snapshot_options do
          automated_snapshot_start_hour ref!(:snapshot_start_hour)
        end
        access_policies do
          version '2012-10-17'
          statement array!(
            -> {
              effect 'Allow'
              principal do
                set!('AWS', '*')
              end
              action 'es:*'
              resource '*'
            }
          )
        end
        advanced_options do
          _camel_keys_set(:auto_disable)
          set!('rest.action.multi.allow_explicit_index', 'true')
        end
        tags array!(
          -> {
            key 'type'
            value 'elasticsearch'
          }
        )
      end
    end
  end

end
