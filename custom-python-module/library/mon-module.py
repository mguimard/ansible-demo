# -*- coding: utf-8 -*-

from ansible.module_utils.basic import AnsibleModule

def main():
    module = AnsibleModule(
        # décrit les paramètres du module
        argument_spec=dict(
            arg1=dict(type='str', default='value1', required=False),
            arg2=dict(type='bool', default=True, required=False),
        ),
        supports_check_mode=True
    )

    # code très élaboré....
    # utilisation de module.params['arg1'] et module.params['arg2']
    # ..... / 

    # construit le retour du module
    result = dict(
        mon_resultat=42,
        changed=False
    )
    # renvoie le retour du module
    module.exit_json(**result)


if __name__ == '__main__':
    main()
