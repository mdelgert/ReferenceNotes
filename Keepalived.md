https://wiki.archlinux.org/title/Keepalived
https://github.com/acassen/keepalived
https://keepalived.readthedocs.io/en/latest/introduction.html
https://nickhowell.uk/2016/07/23/raspberry-pi-nas-with-gluster/

```bash
sudo apt install keepalived -y
sudo nano /etc/keepalived/keepalived.conf
```

# Example master
vrrp_instance VI_1 {
        state MASTER
        interface eth0
        virtual_router_id 51
        priority 150
        advert_int 1
        authentication {
                auth_type PASS
                auth_pass somerandompassword
        }
        virtual_ipaddress {
                192.168.1.80
        }
}

# Example slave
vrrp_instance VI_1 {
        state MASTER
        interface eth0
        virtual_router_id 51
        priority 100
        advert_int 1
        authentication {
                auth_type PASS
                auth_pass somerandompassword
        }
        virtual_ipaddress {
                192.168.1.80
        }
}

### Start
```bash
/etc/init.d/keepalived start
```