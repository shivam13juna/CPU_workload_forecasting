import csv
from functools import *
from multiprocessing.pool import ThreadPool
import models
from random import *



def parse_vnf(row):
    vnf_id = int(row[0])
    vnf_type = int(row[1])
    vnf_scheduling = int(row[2])
    vnf_pm = int(row[3])
    vnf_fg = int(row[4])
    flavor_data = row[5:8]
    vm_data = row[8:11]
    usage_data = row[11:15]

    pm = models.PhysicalMachine(vnf_pm)
    flavor = models.Flavor(min_cpu=float(flavor_data[0]), min_mem=float(flavor_data[1]), min_sto=float(flavor_data[2]))

    return models.VNF(pm, flavor,
               id=vnf_id,
               fg_id=vnf_fg,
               scheduling_class=vnf_scheduling,
               type=next((x for x in models.VNF.types if vnf_type == x[1]), choice(models.VNF.types)),
               vm_cpu=float(vm_data[0]),
               vm_mem=float(vm_data[1]),
               vm_sto=float(vm_data[2]),
               cpu_usage=float(usage_data[0]),
               mem_usage=float(usage_data[1]),
               sto_usage=float(usage_data[2]),
               exec_time=int(usage_data[3]))


def parse_vnfs():
    vnfs_list = []
    with open("results/input/vnfs.csv", 'r') as file:
        readers = csv.reader(file, delimiter=",")
        p = ThreadPool()
        vnfs_list = p.map(parse_vnf, list(readers))
        vnfs = dict((x.id, x) for x in vnfs_list)
        p.close()
        p.join()

    return vnfs


def parse_fgs():
    fgs = {}
    with open("results/input/fgs.csv", "r") as file:
        reader = csv.reader(file, delimiter=",")
        for row in reader:
            fg_id = int(row[0])
            fg_num_flows = int(row[1])
            fg_scheduling = int(row[2])
            flows = []
            nsd = None
            for i in range(fg_num_flows):
                flow_data = next(reader)
                flow = models.Flow(flow_data[0], flow_data[1], float(flow_data[2]), float(flow_data[3]), float(flow_data[4]), float(flow_data[5]))
                flows.append(flow)
                if (nsd is None):
                    nsd = models.NSD(sla=float(flow_data[6]))

            fgs[fg_id] = models.ForwardingGraph(fg_id, scheduling_class=fg_scheduling, flows=flows, nsd=nsd)

    return fgs


def parse_affinity_case(vnfs, fgs, case):
    length = len(case)
    vnf_a_id = int(case[length - 4])
    vnf_b_id = int(case[length - 3])
    fg_id = int(case[length - 2])
    affinity = float(case[length - 1])

    vnf_a = vnfs[vnf_a_id]
    vnf_b = vnfs[vnf_b_id]
    fg = fgs[fg_id] if fg_id != 0 else None
    return (vnf_a, vnf_b, fg, affinity)


def parse_dataset(vnfs, fgs):
    dataset = []

    with open("res/input/nn_dataset.csv", "rb") as file:
        reader = csv.reader(file, delimiter=",")
        p = ThreadPool()
        func = partial(parse_affinity_case, vnfs, fgs)
        dataset = p.map(func, list(reader))
        p.close()
        p.join()

    return dataset
